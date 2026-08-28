#!/usr/bin/env bash
#
# check_invariants.sh — publication invariant checker
#
# Verifies the two publication invariants this product declares, against the
# built output of the site:
#
#   INV-01  Single anchor
#           (a) every published page declares exactly one canonical anchor
#           (b) no canonical anchor is declared by two distinct pages
#
#   INV-02  Referential integrity
#           (a) every internal navigation reference resolves to a route the
#               build actually produced
#           (b) every reference to a governance document, feature or epic
#               resolves to a file that exists in the repository
#
# This checker is part of the product's verification suite, not an auxiliary
# utility: it is what authorises or refuses delivery. See team_playbook.md
# section 4.1 and technical_agreement.md section 4.1.
#
# Bash and POSIX utilities only. Zero dependencies, by approval in
# technical_agreement.md section 1.1: adopting a single-binary generator and
# then requiring a test runtime with its own package manager would cancel the
# isolation that motivated the choice.
#
# A checker that cannot complete its verification MUST fail. Passing without
# having verified produces unjustified confidence, which is worse than having
# no checker at all.
#
# Usage:  bash apps/site/scripts/check_invariants.sh [built-output-dir]
# Exit:   0 = every invariant holds
#         1 = at least one invariant is violated
#         2 = verification could not be performed

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$APP_DIR/../.." && pwd)"
PUBLIC_DIR="${1:-$APP_DIR/public}"

violations=0
pages_examined=0

WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

CANONICALS="$WORK_DIR/canonicals"
: > "$CANONICALS"

say()  { printf '%s\n' "$*"; }
fail() { printf '  ✗ %s\n' "$*"; violations=$((violations + 1)); }
pass() { printf '  ✓ %s\n' "$*"; }

# Emit one HTML tag per line, with unquoted attribute values quoted.
#
# The published artifact is minified, and minified HTML drops attribute quotes:
# `<link rel=canonical href=/en/>`. Matching only the quoted form would make the
# checker blind to the very output that gets delivered. Normalising per tag --
# rather than over the whole file -- keeps script bodies out of the way.
tags_of() {
  grep -o '<[a-zA-Z][a-zA-Z0-9]*[^>]*>' "$1" 2>/dev/null \
    | sed -E 's/=([^"'"'"' >][^ >]*)/="\1"/g' || true
}

cannot_verify() {
  say ""
  say "VERIFICATION COULD NOT BE PERFORMED"
  say "  $1"
  say ""
  say "Refusing to pass. A checker that cannot verify must never report success."
  exit 2
}

# ---------------------------------------------------------------------------
# Pre-conditions. Any failure here is exit 2, never a silent pass.
# ---------------------------------------------------------------------------

say "Publication invariant checker"
say "  built output : $PUBLIC_DIR"
say "  repository   : $REPO_ROOT"
say ""

[ -n "$PUBLIC_DIR" ] || cannot_verify "No built output directory was given."
[ -d "$PUBLIC_DIR" ] || cannot_verify "Built output directory does not exist: $PUBLIC_DIR
  Build the site first:  hugo --source apps/site"

PAGES="$WORK_DIR/pages"
find "$PUBLIC_DIR" -type f -name '*.html' | sort > "$PAGES"

if [ ! -s "$PAGES" ]; then
  cannot_verify "No HTML pages found under: $PUBLIC_DIR
  There is nothing to verify, so this run proves nothing."
fi

# ---------------------------------------------------------------------------
# INV-01 — Single anchor
# ---------------------------------------------------------------------------

say "INV-01  Single anchor"

while IFS= read -r page; do
  rel="${page#"$PUBLIC_DIR"/}"

  # A redirect stub is a pointer, not a published page: it legitimately carries
  # the canonical anchor of its target. It is held to INV-01.a but excluded
  # from the INV-01.b uniqueness set.
  tags="$WORK_DIR/tags"
  tags_of "$page" > "$tags"

  is_redirect=0
  if grep -qi 'http-equiv="refresh"' "$tags"; then
    is_redirect=1
  fi

  count="$(grep -c 'rel="canonical"' "$tags" || true)"

  if [ "$count" -eq 0 ]; then
    fail "INV-01.a  $rel declares no canonical anchor (expected exactly 1)"
    continue
  elif [ "$count" -gt 1 ]; then
    fail "INV-01.a  $rel declares $count canonical anchors (expected exactly 1)"
    continue
  fi

  canonical="$(grep 'rel="canonical"' "$tags" \
    | grep -o 'href="[^"]*"' | sed -e 's/^href="//' -e 's/"$//' | head -n 1)"

  if [ -z "$canonical" ]; then
    fail "INV-01.a  $rel declares a canonical anchor with no address"
    continue
  fi

  if [ "$is_redirect" -eq 0 ]; then
    pages_examined=$((pages_examined + 1))
    printf '%s\t%s\n' "$canonical" "$rel" >> "$CANONICALS"
  fi
done < "$PAGES"

if [ "$pages_examined" -eq 0 ]; then
  if [ "$violations" -gt 0 ]; then
    say ""
    say "REFUSED — $violations violation(s); no page declared a usable canonical anchor."
    say "Delivery must not proceed."
    exit 1
  fi
  cannot_verify "Every HTML file found is a redirect stub; no published page was examined."
fi

# INV-01.b — global uniqueness
DUPES="$WORK_DIR/dupes"
cut -f1 "$CANONICALS" | sort | uniq -d > "$DUPES"

if [ -s "$DUPES" ]; then
  while IFS= read -r dup; do
    holders="$(awk -F'\t' -v c="$dup" '$1 == c { printf "%s ", $2 }' "$CANONICALS")"
    fail "INV-01.b  canonical anchor '$dup' is declared by more than one page: $holders"
  done < "$DUPES"
else
  pass "INV-01.a  each of $pages_examined published pages declares exactly one canonical anchor"
  pass "INV-01.b  all $pages_examined canonical anchors are distinct"
fi

say ""

# ---------------------------------------------------------------------------
# INV-02 — Referential integrity
# ---------------------------------------------------------------------------

say "INV-02  Referential integrity"

dead_routes=0
dead_docs=0

while IFS= read -r page; do
  rel="${page#"$PUBLIC_DIR"/}"
  page_dir="$(dirname "$page")"

  # --- INV-02.a: internal navigation references resolve to built routes -----
  { tags_of "$page" | grep -o 'href="[^"]*"' || true; } \
    | sed -e 's/^href="//' -e 's/"$//' \
    | while IFS= read -r href; do
        # Out of scope for this invariant: external addresses, mail and phone
        # links, and pure fragment anchors.
        case "$href" in
          ''|'#'*|http://*|https://*|//*|mailto:*|tel:*|data:*) continue ;;
        esac

        target="${href%%#*}"
        target="${target%%\?*}"
        [ -n "$target" ] || continue

        case "$target" in
          /*) resolved="$PUBLIC_DIR$target" ;;
          *)  resolved="$page_dir/$target" ;;
        esac

        # A directory-style route is served by its index document.
        case "$resolved" in
          */) resolved="${resolved}index.html" ;;
        esac

        if [ -e "$resolved" ]; then
          continue
        fi
        if [ -e "$resolved/index.html" ] || [ -e "$resolved.html" ]; then
          continue
        fi

        printf 'route\t%s\t%s\n' "$rel" "$href"
      done >> "$WORK_DIR/dead"

  # --- INV-02.b: references to repository documents exist ------------------
  # Strip markup so attribute values are not rescanned here; INV-02.a already
  # owns them. What remains is the text the visitor actually reads.
  { sed -e 's/<[^>]*>/ /g' "$page" \
    | grep -oE '(features|apps|assets|scripts|\.agents)/[A-Za-z0-9_.-]+(/[A-Za-z0-9_.-]+)*|\b[a-z][a-z0-9_]*\.md\b' || true; } \
    | sed -e 's/[.,;:]\+$//' \
    | sort -u \
    | while IFS= read -r ref; do
        [ -n "$ref" ] || continue
        if [ -e "$REPO_ROOT/$ref" ]; then
          continue
        fi
        # A bare document name may live anywhere in the repository.
        case "$ref" in
          */*) : ;;
          *)
            if find "$REPO_ROOT" -name "$ref" -not -path '*/.git/*' \
                 -print -quit 2>/dev/null | grep -q .; then
              continue
            fi
            ;;
        esac
        printf 'doc\t%s\t%s\n' "$rel" "$ref"
      done >> "$WORK_DIR/dead"
done < "$PAGES"

if [ -s "$WORK_DIR/dead" ]; then
  while IFS=$'\t' read -r kind where what; do
    if [ "$kind" = "route" ]; then
      fail "INV-02.a  $where references route '$what', which the build did not produce"
      dead_routes=$((dead_routes + 1))
    else
      fail "INV-02.b  $where references '$what', which does not exist in the repository"
      dead_docs=$((dead_docs + 1))
    fi
  done < "$WORK_DIR/dead"
fi

if [ "$dead_routes" -eq 0 ]; then
  pass "INV-02.a  every internal route reference resolves to a built page"
fi
if [ "$dead_docs" -eq 0 ]; then
  pass "INV-02.b  every repository document reference resolves to an existing file"
fi

# ---------------------------------------------------------------------------
# Outcome
# ---------------------------------------------------------------------------

say ""
if [ "$violations" -gt 0 ]; then
  say "REFUSED — $violations violation(s) across $pages_examined published page(s)."
  say "Delivery must not proceed."
  exit 1
fi

say "PASSED — $pages_examined published page(s) examined, no violations."
exit 0

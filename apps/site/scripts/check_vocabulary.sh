#!/usr/bin/env bash
#
# check_vocabulary.sh — INV-03.b checker (forbidden synonyms)
#
# Verifies the structurally-checkable half of INV-03 (single vocabulary), as
# defined in
# features/03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md
# section 2:
#
#   INV-03.b  no forbidden synonym listed for a glossary term appears in
#             published text of any page.
#
# INV-03.a (that a term, where used, is used with its glossary meaning) is
# NOT checked here: deciding whether a passage uses a word with the glossary
# sense is a semantic judgement a zero-dependency Bash checker cannot make
# without producing false positives or false negatives, which the product's
# own doctrine treats as worse than no checker at all (technical_agreement.md
# section 4.1). INV-03.a stays an editorial requirement.
#
# The phrase list itself (scripts/forbidden_synonyms.tsv) is a deliberately
# curated subset of the full forbidden-synonym catalogue in plan.md section
# 5-6, for the same reason: only phrases with no legitimate independent
# meaning elsewhere in this site's English content are safe to blind-match.
#
# The glossary page is EXEMPT from this scan. Its job is to document what not
# to call each concept, which means it must print the forbidden phrases
# verbatim — the dictionary entry that defines a word as improper is not
# itself misusing it. Failing that page would be the checker punishing the
# one page whose existence makes INV-03 possible to honour elsewhere.
#
# Bash and POSIX utilities only. Same zero-dependency homologation as
# check_invariants.sh (technical_agreement.md section 1.1).
#
# Usage:  bash apps/site/scripts/check_vocabulary.sh [built-output-dir]
# Exit:   0 = no forbidden synonym found
#         1 = at least one forbidden synonym found
#         2 = verification could not be performed

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PUBLIC_DIR="${1:-$APP_DIR/public}"
DATA_FILE="$SCRIPT_DIR/forbidden_synonyms.tsv"

# The glossary page's built path, relative to $PUBLIC_DIR. Exempt for the
# reason documented above.
EXEMPT_SUFFIX="en/method/glossary/index.html"

violations=0
pages_examined=0
phrases_loaded=0

say()  { printf '%s\n' "$*"; }
fail() { printf '  ✗ %s\n' "$*"; violations=$((violations + 1)); }
pass() { printf '  ✓ %s\n' "$*"; }

cannot_verify() {
  say ""
  say "VERIFICATION COULD NOT BE PERFORMED"
  say "  $1"
  say ""
  say "Refusing to pass. A checker that cannot verify must never report success."
  exit 2
}

say "Vocabulary checker (INV-03.b — forbidden synonyms)"
say "  built output : $PUBLIC_DIR"
say "  phrase list  : $DATA_FILE"
say ""

[ -f "$DATA_FILE" ] || cannot_verify "Forbidden-synonym data file not found: $DATA_FILE"
[ -d "$PUBLIC_DIR" ] || cannot_verify "Built output directory does not exist: $PUBLIC_DIR
  Build the site first:  hugo --source apps/site"

PAGES="$(mktemp)"
trap 'rm -f "$PAGES"' EXIT
find "$PUBLIC_DIR" -type f -name '*.html' | sort > "$PAGES"

if [ ! -s "$PAGES" ]; then
  cannot_verify "No HTML pages found under: $PUBLIC_DIR
  There is nothing to verify, so this run proves nothing."
fi

# Count non-comment, non-empty phrase lines up front so an empty or
# all-comment data file is also treated as "could not verify" rather than a
# silent, vacuous pass.
while IFS=$'\t' read -r term phrase; do
  case "$term" in ''|'#'*) continue ;; esac
  [ -n "${phrase:-}" ] || continue
  phrases_loaded=$((phrases_loaded + 1))
done < "$DATA_FILE"

[ "$phrases_loaded" -gt 0 ] || cannot_verify "Forbidden-synonym data file has no usable entries: $DATA_FILE"

while IFS= read -r page; do
  rel="${page#"$PUBLIC_DIR"/}"

  case "$rel" in
    "$EXEMPT_SUFFIX")
      say "  (skipping $rel — the glossary page documents forbidden synonyms by design)"
      continue
      ;;
  esac

  pages_examined=$((pages_examined + 1))

  # Strip tags so we search the text a visitor reads, not markup or
  # attribute values.
  text="$(sed -e 's/<[^>]*>/ /g' "$page")"

  while IFS=$'\t' read -r term phrase; do
    case "$term" in ''|'#'*) continue ;; esac
    [ -n "${phrase:-}" ] || continue

    if printf '%s' "$text" | grep -qiF -- "$phrase"; then
      fail "INV-03.b  $rel uses forbidden synonym '$phrase' for term '$term'"
    fi
  done < "$DATA_FILE"
done < "$PAGES"

say ""
if [ "$violations" -eq 0 ]; then
  pass "no forbidden synonym found across $pages_examined page(s) examined ($phrases_loaded phrase(s) checked)"
fi

say ""
if [ "$violations" -gt 0 ]; then
  say "REFUSED — $violations violation(s) across $pages_examined published page(s)."
  say "Delivery must not proceed."
  exit 1
fi

say "PASSED — $pages_examined published page(s) examined, no violations."
exit 0

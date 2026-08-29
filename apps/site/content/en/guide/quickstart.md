---
title: "Quickstart"
description: "The complete happy path for adopting Spec-Driven Development (Liquid): from cloning the template to a first approved plan.md, with every command verified against the repository."
lead: "Four steps, start to first approved plan. Nothing here requires opening the repository to find the next step."
---

This page is the whole path — the same one [The Method](../../method/) explains
the reasoning for. Every command below is reproduced from the project's own
[README](https://github.com/m4rc0s/agentic_sample), not approximated from
memory.

## 1. Create the workspace from the template

Click **"Use this template"** on GitHub, or clone the repository directly
into its own isolated [Workspace](../../method/glossary/):

```bash
mkdir -p $HOME/product_design/myproduct
git clone <YOUR_TEMPLATE_URL> $HOME/product_design/myproduct
cd $HOME/product_design/myproduct
rm -rf .git
git init
```

This is Pillar 1 of the method in practice — one isolated container per
product, never a generic monorepo.

## 2. Initialise the root context

Fill in, or instruct an agent to fill in, the four root governance
[Specs](../../method/glossary/), in this order:

1. `product_vision.md` — the problem and the business value.
2. `architecture.md` — the high-level architectural model.
3. `technical_agreement.md` — the homologated stack and non-negotiable
   restrictions (the [AI Handcuffs](../../method/workspace-and-guardrails/)).
4. `roadmap.md` — the product's macro phases.

## 3. Spin up the agent session

Point an agent session's volume **exclusively** at the product folder, then
send the activation prompt:

```text
This is a newly initialised Liquid v1 workspace. Read all governance files
at the root (index.md, architecture.md, technical_agreement.md,
product_vision.md) to assimilate this product's domain. Confirm once you
are contextualised so we can start outlining our first business feature.
```

{{< callout label="Which agents this actually supports today" >}}
The repository's root carries two agent-instruction files, and this note
describes exactly what each one delivers, checked against `main` for this
page rather than copied from the README's aspirational list:

- **`AGENTS.md`** is universal — its instructions apply to any autonomous
  agent that reads the file, by design, not by naming a specific product.
- **`CLAUDE.md`** is a short, Claude Code–specific bootstrap that points to
  `AGENTS.md` and lists the same governance files to read first.

No dedicated instruction file exists today for Antigravity, Cursor, Copilot
or Hermes specifically. Any of them can operate the method by reading the
universal `AGENTS.md` — that file makes no Claude-specific assumption — but
only Claude Code has a file addressed to it by name. Installing or
configuring any particular agent is out of scope here: follow that agent's
own official documentation.
{{< /callout >}}

## 4. Reach the first approved plan.md

With the context in place, define the first [Feature](../../method/glossary/)
and shape its first [Epic](../../method/glossary/):

```bash
chmod +x scripts/scaffold.sh
./scripts/scaffold.sh feature auth-identity
./scripts/scaffold.sh epic auth-identity social-login
```

Fill in the epic's `index.md` with its business scope, then have the agent
propose `plan.md` — the [Domain Enabler](../../method/glossary/) document. The
happy path ends here, not before: per the [Definition of
Ready](../../method/lifecycle-and-roles/), `plan.md` must be **explicitly
reviewed and approved by the human Tech Lead** before any code execution can
begin. Once it is approved, the [Prompt Book](../prompt-book/) has the exact
prompts for every step you just took, and for everything that comes after.

**Source:** this page's four steps reproduce `README.md`'s "How to Use This
Template" section and `.agents/hermes_bootstrap.md`'s activation prompt
without paraphrase drift; the agent-support note is drawn from a direct
reading of `AGENTS.md` and `CLAUDE.md` as they exist in this repository
today, not from `README.md` section 1's list of intended integrations.

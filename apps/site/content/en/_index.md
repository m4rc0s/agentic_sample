---
title: "Artificial intelligence did not solve software architecture. It automated the writing of syntax."
description: "Spec-Driven Development (Liquid): the Markdown specification is the software, the code in apps/ is a disposable consequence. The method's pillars, its workflow cycle, and where to go next."
lead: "Spec-Driven Development (Liquid) inverts what is durable: the Markdown specification is the software, and the code inside `apps/` is Consequential Code — regenerable at any time from the spec that authorised it."
---

If an AI agent can produce working code from an intention in minutes, code
stops being the scarce resource. What stays scarce is a correctly specified
business intent — and that is what this method treats as the product's
durable asset. The full argument, including what this deliberately leaves
out of domain modelling, is in [The Paradigm](method/paradigm/).

## What's different

Liquid shares its core philosophy with the wider spec-first movement, and
adds three things of its own on top of it:

| Pillar | Description |
| :--- | :--- |
| **1. Absolute Isolation by [Workspace](method/glossary/)** | An isolated container per product (`$HOME/product_design/myproduct/`). No generic monorepos, shielding the blast radius and mitigating context hallucination. |
| **2. The Universal [Manifest](method/glossary/) (`app_liquid.md`)** | Every physical application in `apps/` carries an agnostic metadata layer, orienting the AI agent on stack, purpose, entry point and contracts without scanning deep syntax trees. |
| **3. Navigation Based on Programmatic [Anchors](method/glossary/) (`index.md`)** | Hierarchical navigation built on `index.md` files, optimised for semantic search, low token consumption and indexing by LLMs. |

Liquid is not an isolated invention — see how it positions itself against
[the wider ecosystem](method/ecosystem-positioning/) it draws from.

## How work moves

Every piece of work in a Liquid workspace passes through the same seven
stages, from root governance to the audit trail:

1. **Root Governance** — `product_vision.md`, `architecture.md` and
   `technical_agreement.md` set the intent, the structure and the
   constraints.
2. **Feature Definition** — the business scope lands in a Feature's
   `index.md`.
3. **Domain Modelling** — an Epic's `plan.md` models the
   [Conceptually-Strict DDD](method/paradigm/) that applies, or declares,
   with justification, that none does.
4. **Human Validation** — the [Chief Architect / Tech
   Lead](method/lifecycle-and-roles/) reviews the plan before anything is
   built from it.
5. **Operational Queue** — the approved plan becomes an ordered `tasks.md`.
6. **Consequential Execution** — the agent generates [Consequential
   Code](method/glossary/) inside `apps/`, each application carrying its own
   `app_liquid.md` Manifest.
7. **Continuous Audit** — every level's `quick_status.md` records what
   happened, keeping the trail honest.

The [Lifecycle and Roles](method/lifecycle-and-roles/) page details who —
human or agent — is responsible for each stage, plus the Definition of Ready
and Definition of Done that gate it.

## Where to go next

- **Understand the method** — [The Method](method/) is the full manual:
  canonical vocabulary, the paradigm, the lifecycle and roles, the workspace
  anatomy, and where Liquid sits in the wider spec-driven ecosystem.
- **See the repository** — the [source repository](https://github.com/m4rc0s/agentic_sample)
  is the same workspace this page describes. Every Spec that produced this
  page is committed there, next to the page itself.

{{< callout label="Open decisions" >}}
Two calls to action are deliberately not on this page: an invitation to
start adopting the method today, and a "living proof" seal linking to the
trail of Specs that produced this very site. Both would point to features
that do not exist in this repository yet. Neither is stubbed in as a
placeholder — each will link from here once the feature behind it is built.
See this feature's `index.md`, section 6, for the record of this decision.
{{< /callout >}}

**Source:** this page's thesis is drawn from `index.md` section 1 and
`README.md`'s "What is Spec-Driven Development (Liquid)?"; the three pillars
reproduce `README.md`'s "The 3 Pillars of the Liquid Model"; the seven-stage
cycle reproduces the flowchart in `README.md`'s "The Development Cycle with
Agents" without paraphrase drift.

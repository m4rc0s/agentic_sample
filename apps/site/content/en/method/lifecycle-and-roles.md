---
title: "Lifecycle and Roles"
description: "The six steps of the Liquid workflow, the human-agent role matrix, and the Definition of Ready and Definition of Done — reproduced faithfully from the project's own governance documents."
lead: "Where the human decides, and where the agent acts alone."
---

## The six-step workflow

Every piece of work in a Liquid workspace moves through the same sequence,
whether the product is this method's own site or any product built with it.

1. **Contextualisation.** The agent reads the root [Anchor](../glossary/)
   (`index.md`), `product_vision.md`, `architecture.md` and
   `technical_agreement.md` to assimilate the product's domain.
2. **Feature definition.** Creation of the `features/[feature-name]/index.md`
   folder, scoping the business value.
3. **Epic modelling (`plan.md`).** The agent proposes the conceptual DDD —
   Entities, Domain Invariants, Domain Events. The Tech Lead / Architect
   reviews it.
4. **Operational queue (`tasks.md`).** The approved plan is sliced into
   sequential, atomic tasks.
5. **Code execution (`apps/` and `app_liquid.md`).** The agent generates the
   Consequential Code implementation inside `apps/`.
6. **Continuous audit (`quick_status.md`).** Local and global execution
   trails are updated.

## Roles: human and agent

| Role | Held by | Main responsibilities |
| :--- | :--- | :--- |
| **Chief Architect / Tech Lead** | Human | Sets the product vision, approves conceptual plans (`plan.md`), validates technical agreements, and steers the roadmap. |
| **Domain Enabler** (Hermes / Architect Agent) | AI agent | Analyses business intent, models conceptual DDD in `plan.md`, maps events, and validates systemic consistency. |
| **Task Executor** (Claude Code / Antigravity) | AI agent | Atomically executes the `tasks.md` queue, generates Consequential Code in `apps/`, runs tests, and updates `quick_status.md`. |
| **Reviewer & QA** | Human + scripts | Runs continuous audit, validates acceptance criteria, and approves commits. |

The boundary these four roles draw is the method's central discipline: a
human owns the vision and approves the domain model; an agent infers the
implementation from an approved model, never the reverse.

## Definition of Ready (DoR) — cleared to start

An Epic's code execution may only begin once:

- [ ] The epic's `index.md` details the business scope and acceptance
      criteria.
- [ ] `plan.md` is conceptually modelled with Entities, Domain Invariants and
      Domain Events, with no ORM coupling.
- [ ] `plan.md` has been explicitly reviewed and approved by the human Tech
      Lead.
- [ ] `tasks.md` contains atomic, ordered tasks with clear verification
      criteria.
- [ ] The target application's [Manifest](../glossary/) (`app_liquid.md`) is
      up to date.

## Definition of Done (DoD) — cleared to deliver

An Epic is only `Done` when:

- [ ] 100% of the tasks listed in `tasks.md` are checked off `[x]`.
- [ ] The epic's automated verification suite passes in full, with no
      errors. What that suite *verifies* is defined by the epic's `plan.md`.
- [ ] No code violates the [AI Handcuffs](../glossary/) in
      `technical_agreement.md`.
- [ ] The epic's and the feature's local `quick_status.md` are updated with
      the audit trail.
- [ ] The Git commit follows the Conventional Commits standard.

{{< callout label="When plan.md declares no conceptual domain" >}}
Not every product has a rich domain. Products and epics with no transaction,
no state mutation and no entity lifecycle have no Domain Invariant to cover —
forcing one produces either an epic that can never be `Done`, or fabricated
entities invented only to satisfy the template. The method's own rule: a
`plan.md` **may** explicitly declare the absence of conceptual domain, with
justification, as a legitimate modelling outcome. When it does, the
completion criterion accepts **artifact invariants verified by an automated
checker** in place of domain-invariant tests — the green suite stays
mandatory; what changes is the object being verified, never the rigour. This
very site is built under that rule: see the [Paradigm](../paradigm/) page for
why, and this manual's own epics for it in practice.
{{< /callout >}}

**Source:** this page reproduces `index.md` section 4 ("The AI Agent
Workflow"), `team_playbook.md` section 1 ("Roles and Responsibilities
Matrix"), section 3 (Definition of Ready) and section 4 (Definition of Done,
including its section 4.1 amendment) without paraphrase drift.

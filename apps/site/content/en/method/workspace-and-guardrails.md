---
title: "Workspace Anatomy & AI Handcuffs"
description: "A map of every root file, features/, epics/, apps/ and assets/, the role of the index.md anchors, and why each AI Handcuff exists."
lead: "The boundaries of the method, before you adopt it, not after."
---

## The workspace, mapped

A Liquid [Workspace](../glossary/) is a single isolated container per
product. This is what lives inside one, and what each part is for.

| Path | Purpose |
| :--- | :--- |
| `index.md` | The root [Anchor](../glossary/): master governance and navigation document. |
| `product_vision.md` | Macro vision, the central problem, target audience, business model and success metrics. |
| `roadmap.md` | Strategic direction, maturity phases and global delivery milestones. |
| `architecture.md` | Systemic patterns, abstract C4 model, context boundaries and integrations. |
| `technical_agreement.md` | Technical agreements, non-negotiable restrictions, homologated stack and the AI Handcuffs. |
| `team_playbook.md` | Rules of engagement, agent rituals, acceptance criteria and Definition of Done. |
| `quick_status.md` | Real-time executive status panel (Ready, WIP, Blocked, Done). |
| `assets/` | Visual documents, wireframes, diagrams and design reference assets. |
| `apps/` | The physical layer: Consequential Code and `app_liquid.md` manifests. |
| `features/` | Domain modules sliced into vertical features and atomic epics. |
| `.agents/` | Bootstrap prompts and activation guides for AI agents. |
| `scripts/` | Scaffolding utilities for new features, epics and applications. |

Inside `features/`, the same anchor discipline repeats one level down: every
Feature has its own `index.md`, and every Epic inside it has its own
`index.md`, `plan.md`, `tasks.md`, `quick_status.md` and `epic_roadmap.md`.
The [Anchor](../glossary/) exists at every level for the same reason it
exists at the root — a clean, hierarchical taxonomy optimised for
high-precision semantic search and low token consumption, so an agent or a
person can orient itself at any depth without scanning the whole tree.

## The AI Handcuffs

`technical_agreement.md` registers a set of restrictions autonomous agents
must never violate. They are not suggestions — the source document calls
itself "the non-negotiable technical contract" — and each one closes a
specific failure mode the method is built to prevent.

### Forbidden actions

| Restriction | Why it exists |
| :--- | :--- |
| Do not install unapproved packages or dependencies without explicit authorisation or prior registration in the target `app_liquid.md`. | An unapproved dependency is exactly the kind of implementation detail the human never agreed to, sneaking in below the level the Chief Architect / Tech Lead actually reviews. |
| Do not hardcode API keys, passwords or tokens in code or Markdown; use environment variables instead. | Specs and code alike are versioned and often public — a hardcoded secret in either becomes a permanent leak the moment it is committed. |
| Do not implement code without automated tests covering the invariants described in `plan.md` — or, when `plan.md` declares no conceptual domain, without a checker covering the artifact invariants it enunciates instead. | This is the rule that keeps a "no domain" declaration honest: it changes what gets verified, never whether something does. Code with no invariant verified at all remains forbidden either way. |
| Do not alter API contracts without updating the corresponding feature's Spec. | If the code and the Spec disagree about a contract, the Spec — the method's durable asset — has silently stopped being the source of truth. |
| Do not perform arbitrary file creation outside `apps/`, or without an associated task in `tasks.md`. | This is the rule against what the corpus calls "vibe coding": code with no task behind it is code nobody reviewed the intent for. |

### Mandatory patterns

| Pattern | Why it exists |
| :--- | :--- |
| Typed error handling — no empty `catch (e) {}`. Every domain error must return a well-defined semantic type. | A silently swallowed error is a failure mode nobody can reason about later, human or agent. |
| Immutability and strict typing wherever the language allows it. | Reduces the surface where an AI agent's inferred implementation can drift from the modelled intent without anyone noticing. |
| Idempotency for event handlers and state-mutating commands. | A retried request must never duplicate data — retries are the normal case in agent-driven execution, not the exception. |
| Domain isolation: pure business logic must not depend on web frameworks or ORMs (Clean Architecture / Ports & Adapters). | Keeps the conceptual domain model — the part a human actually reviews in `plan.md` — free of framework churn that has nothing to do with business intent. |

{{< callout label="This site's own Handcuffs are honest about what applies" >}}
A static site has no transaction, no state mutation and no ORM to isolate
domain logic from — several of these restrictions describe failure modes
this product cannot have. `technical_agreement.md` section 1.1 registers that
honestly rather than declaring a technology that does not exist here: the
backend, database and web framework rows are marked **Not applicable**, and
the "automated tests for invariants" rule is satisfied by the artifact
checkers this manual describes in [Lifecycle and Roles](../lifecycle-and-roles/).
{{< /callout >}}

**Source:** this page maps `index.md` section 3 ("Navigation Map and
Governance Files") and `README.md`'s "Repository Anatomy," and reproduces
`technical_agreement.md` section 2 ("The AI Handcuffs") in full, with each
restriction's purpose drawn from that same document rather than invented
here.

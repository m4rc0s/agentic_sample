---
title: "Glossary"
description: "The canonical vocabulary of the Liquid method: exact definitions, forbidden synonyms and relations for every core term, extracted from the project's own governance documents."
lead: "The single source of vocabulary for this manual, and for the whole site. Every other page uses these terms with these meanings."
---

{{< callout label="A note on language" >}}
This page is published in English, but the terms it defines were coined in
the Portuguese-language governance corpus of this repository (`index.md`,
`README.md`, `team_playbook.md`, `technical_agreement.md`). Where a term was
authored in Portuguese, its original wording is cited in parentheses next to
the English translation this site uses, so a reader who already knows the
method in Portuguese recognises the concept. This is a deliberately open
tension, not a decision this page makes on its own — see
`features/01-fundacao-publicacao/index.md` section 6.1.
{{< /callout >}}

## Why this page exists

Spec-Driven Development (Liquid) is, at its core, a **Domain Enabler**
applied to itself: this glossary is the Ubiquitous Language (`Linguagem
Ubíqua`) of the method, in the strict Domain-Driven Design sense described in
`index.md` section 1 — the exact terms that the business and AI agents must
share. It is the one genuine conceptual domain this product has: not the
domain of a static site, but the domain of the method the site publishes.

Nine core terms and ten supporting terms are defined below. Every term
carries the document it was extracted from, so a claim here can be checked
against the source rather than taken on faith.

## Core terms at a glance

| Term | Original term (PT) | In one line |
| :--- | :--- | :--- |
| Workspace | `workspace` | The isolated container for a single product. |
| Feature | `feature` | A vertical slice of business value. |
| Epic | `épico` | An atomic delivery package inside a Feature. |
| Spec | `especificação` / `spec` | The Markdown document that is the executable contract. |
| Manifest | `manifesto` (`app_liquid.md`) | The agent-readable descriptor every app in `apps/` must carry. |
| Anchor | `âncora` (`index.md`) | The navigational anchor file at every level of the workspace. |
| AI Handcuffs | `Algemas da IA` | The non-negotiable restrictions agents must never violate. |
| Domain Enabler | `Domain Enabler` | The role — and the document — that models conceptual DDD for an epic. |
| Consequential Code | `Código Consequencial` | The disposable code generated in `apps/` from specs. |

## Core terms

### Workspace

**Original term:** `workspace` — the source corpus already uses the English
word without translation (`index.md`'s subtitle: "Master Governance and
Navigation Document of the **Workspace**"; the agent activation prompt in
`.agents/hermes_bootstrap.md`: "This is a newly initialised Liquid v1
**workspace**"). No translation decision was needed here.

**Definition:** The container isolated per product — a single agent session
operates exclusively inside it. Source: `README.md`, Pillar 1, "Absolute
Isolation by Workspace": *"An isolated container per product
(`$HOME/product_design/myproduct/`). No generic monorepos, shielding the
blast radius and mitigating context hallucination."*

**Forbidden synonyms:** a monorepo, a generic project folder.

**Related terms:** contains the root governance Specs, `features/`, `apps/`
and `assets/`. It is the scope of the Absolute Isolation pillar.

### Feature

**Original term:** `feature` — also an English loanword in the source
corpus.

**Definition:** A vertical slice of business value, scoped at
`features/<id>-<name>/`, with its own `index.md` (business scope),
`feat_roadmap.md`, `quick_status.md` and `epics/` directory. Source:
`features/README.md`, "Hierarchy and Standardisation of `index.md`" and its
subtitle, "Native Agile Management in the Directory Tree."

**Forbidden synonyms:** an Epic (different granularity — see below), a
sprint, a user story on its own (a Feature *contains* user stories; it is not
one).

**Related terms:** decomposes into one or more Epics; its `index.md` is an
Anchor; its approved scope becomes Consequential Code in `apps/` through its
epics.

### Epic

**Original term:** `épico`.

**Definition:** An atomic delivery package inside a Feature, at
`features/<feature>/epics/<epic>/`, with its own `index.md` (bounded context
and acceptance criteria), `plan.md` (the Domain Enabler document),
`tasks.md`, `quick_status.md` and `epic_roadmap.md`. Source:
`features/README.md`, "Hierarchy," and `README.md`, "Repository Anatomy."

**Forbidden synonyms:** a sprint, a user story, a task on its own (a task is
one atomic item inside `tasks.md`, not the whole epic), a Feature.

**Related terms:** belongs to exactly one Feature; its `plan.md` is modelled
by the Domain Enabler; its `tasks.md` produces Consequential Code under the
Task Executor's supervision.

### Spec

**Original term:** `especificação` / `spec` — both used in the corpus
(`README.md`'s tagline: *"The specification is the software"*; `index.md`:
*"the spec is the executable contract"*).

**Definition:** Any structured Markdown document that constitutes the
executable contract of business intent and domain — the root governance
documents and the documents inside `features/`/`epics/`. It is the product's
durable asset, as opposed to code, which is a consequence. Source:
`README.md`, "What is Spec-Driven Development (Liquid)?", item 1: *"Documentation
is the Executable Contract: the product's durable asset is the business
intent, the domain, and the immutable specifications written in structured
Markdown."*

**Forbidden synonyms:** supplementary documentation (inverts the hierarchy —
a Spec is not auxiliary to anything, it is the software itself), a code
comment, a PRD (a different methodology's artifact, not used here).

**Related terms:** every Feature and Epic produces Specs; a Manifest is a
Spec scoped to one application in `apps/`; Consequential Code derives from
Specs, never the reverse.

### Manifest (`app_liquid.md`)

**Original term:** `manifesto` (`app_liquid.md`).

**Definition:** A language-agnostic metadata layer that every application in
`apps/` must carry at its root, declaring stack, purpose, entry point and
dependency scope — sparing an agent from scanning deep syntax trees. Source:
`index.md` section 2, item 2: *"The Universal Manifest (`app_liquid.md`): we
created an agnostic metadata layer for the physical applications inside
`apps/`."*; `apps/README.md`, "The Golden Rule."

**Forbidden synonyms:** a config file in the generic sense, a `package.json`.
(A README is a related but distinct artifact — see "Anchor" below for why the
two are not interchangeable.)

**Related terms:** lives inside one physical application, itself an instance
of Consequential Code; its declared stack must be identical to the one
homologated in `technical_agreement.md` section 1.

### Anchor (`index.md`)

**Original term:** `âncora` / `âncoras programáticas`.

**Translation note:** "Anchor" is a direct, literal translation; the corpus
already frames the pillar as "Navigation Based on Programmatic Anchors,"
which carries the same fixed-reference-point image in English.

**Definition:** An `index.md` file, present at every hierarchical level of
the workspace (root, feature, epic), serving as the navigation and semantic
anchoring point, optimised for high-precision search and low token
consumption by LLMs. Source: `index.md` section 2, item 3: *"Navigation Based
on Programmatic Anchors (`index.md`): we replaced fragmented naming with a
clean, hierarchical taxonomy based on `index.md`... optimised specifically
for high-precision semantic search and LLM token consumption."*

**Forbidden synonyms:** a table of contents, a sitemap. (A README is a
related but distinct artifact: a README is prose for a human reader; an
Anchor is structure for programmatic navigation — the two coexist at the
repository root, each with its own job.)

**Related terms:** exists at every level — Workspace, Feature, Epic; it is
the "Contextualisation" step of the agent workflow (`index.md` section 4,
step 1).

### AI Handcuffs

**Original term:** `Algemas da IA`.

**Translation note:** "AI Handcuffs" is the literal translation chosen here,
deliberately not softened. The source document uses an assertive register on
purpose — *"This file is the **non-negotiable** technical contract"* — and
softer English alternatives such as "guardrails" or "constraints" lose
exactly the physical-restraint, non-negotiable connotation the original
carries. "Handcuffs" keeps the image intact.

**Definition:** The set of non-negotiable restrictions autonomous agents must
never violate — forbidden actions and mandatory patterns — registered in
`technical_agreement.md` section 2. Source: `technical_agreement.md` section
2, "The 'AI Handcuffs' (Non-Negotiable Boundaries and Restrictions)":
*"Autonomous Agents must **NEVER** violate the following rules."*

**Forbidden synonyms:** guidelines (implies optionality; AI Handcuffs are
non-negotiable), rules on their own without qualification (too generic to
name this specific set).

**Related terms:** live in `technical_agreement.md`, a Spec document; govern
every production of Consequential Code; their violation is the criterion that
fails an epic's Definition of Done.

### Domain Enabler

**Original term:** `Domain Enabler` — already in English in the source
corpus.

**Definition:** Used in two inseparable senses in the corpus, both preserved
here: **(a)** the AI agent role that analyses business intent and models
conceptual DDD in `plan.md` — source: `team_playbook.md` section 1, "**Domain
Enabler (Hermes / Architect Agent)** | AI Agent | Analyses business intent,
models conceptual DDD in `plan.md`..."; and **(b)** the `plan.md` document
itself, whose internal title in every epic of this repository literally reads
"Domain Enabler (Conceptual DDD Plan): [epic-name]." The role produces the
document; the document carries the role's name.

**Forbidden synonyms:** a Product Owner (a different human role — the owner
of the vision, not the modeller of domain), a database designer (the Domain
Enabler explicitly does not model an ORM, SQL or a schema — `index.md`
section 1).

**Related terms:** produces an Epic's `plan.md`; operates under the Chief
Architect / Tech Lead's approval; its entities and invariants, when they
exist, feed `tasks.md`.

### Consequential Code

**Original term:** `Código Consequencial` / `código consequencial e
descartável`.

**Translation note:** "Consequential Code" is a direct cognate that preserves
the exact philosophical structure of the original — code as a *consequence*
of the spec, not as an asset in its own right. Alternatives such as
"generated code" or "disposable code" capture only one of the two properties
(generation, disposability); "Consequential Code" names the full causal
relation: the spec is the cause, the code is the consequence.

**Definition:** The physical software generated in `apps/` from the specs —
strictly disposable and regenerable at any time; not the product's durable
asset. Source: `README.md`, "What is...", item 2: *"Code is a Consequence:
the physical code generated in the `apps/` folder is disposable and
regenerable at any moment from the specs."*; `index.md`: *"the source code
becomes strictly consequential and disposable."*

**Forbidden synonyms:** legacy code, a "source of truth" said of the code
specifically (the Spec is the source of truth; the code never is).

**Related terms:** lives in `apps/`, always accompanied by a Manifest; is
produced from `tasks.md`, which derives from an approved `plan.md`; its
absence or full regeneration does not change the product's durable asset.

## Supporting terms

These are not part of the nine core terms above, but the other pages of this
manual — the paradigm, the lifecycle and roles, and the workspace anatomy —
use them directly. They are registered here, with the same sourcing
discipline, so no other page has to invent its own translation.

| Term (EN) | Original term (PT) | In one line | Source |
| :--- | :--- | :--- | :--- |
| Bounded Context | `Bounded Context` (already English) | The limits of where one business rule begins and ends. | `index.md` section 1 |
| Ubiquitous Language | `Linguagem Ubíqua` | The exact terms business and AI agents must share — this glossary is that, for Liquid. | `index.md` section 1 |
| Conceptually-Strict DDD | `DDD Estritamente Conceitual` | The DDD scope Liquid keeps: Bounded Contexts, Ubiquitous Language, Entities/Invariants and Domain Events — no tables, ORM or migrations. | `index.md` section 1; `README.md`, "What is...", item 3 |
| Domain Invariant | `Regra de Negócio Invariante` | The system's core, non-negotiable behaviour — where one exists; epics without domain declare its absence. | `index.md` section 1; `team_playbook.md` section 4.1 |
| Domain Event | `Evento de Domínio` | What happens, and who must react, when a critical state changes. | `index.md` section 1 |
| Definition of Ready (DoR) | `Definition of Ready (DoR)` | The checklist that authorises an epic's code execution to begin. | `team_playbook.md` section 3 |
| Definition of Done (DoD) | `Definition of Done (DoD)` | The checklist that authorises marking an epic complete. | `team_playbook.md` section 4 |
| Chief Architect / Tech Lead | `Arquiteto Supremo / Tech Lead` | The human role that sets product vision, approves `plan.md`, validates technical agreements. | `team_playbook.md` section 1 |
| Task Executor | `Task Executor` (already English) | The AI agent role that executes `tasks.md` and generates Consequential Code. | `team_playbook.md` section 1 |
| Reviewer & QA | `Reviewer & QA` (already English) | The human-plus-scripts role that audits, validates acceptance criteria, and approves commits. | `team_playbook.md` section 1 |

## How this glossary is enforced

Two publication invariants protect this vocabulary once it is published,
defined in
`features/03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`:

- **Vocabulary consistency (INV-03):** every term above is used, wherever it
  appears on this site, with the meaning defined here — and none of its
  forbidden synonyms appears in published text. The synonym check runs as an
  automated part of this site's verification suite; a smaller, safe subset of
  the forbidden phrases above is checked by exact text search, and the rest
  — the phrases that also have a legitimate, unrelated meaning elsewhere on
  this site — are enforced editorially.
- **Traceability (INV-04):** every claim this manual makes about the method
  is attributable to an identifiable Spec document, as this page's citations
  demonstrate.

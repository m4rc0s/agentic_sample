---
title: "The Paradigm"
description: "Why the spec is the software and the code is a consequence, and what Liquid means by conceptually-strict DDD — including what it deliberately leaves out."
lead: "The argument behind the method, not just the slogan."
---

Artificial intelligence did not solve software architecture; it automated the
writing of syntax. That is the starting claim of Spec-Driven Development
(Liquid), and this page is the argument for it, not just the slogan.

## The inversion: documentation is the executable contract

Once an AI agent can produce working code from an intention in minutes, code
stops being scarce. What was scarce all along — and still is — is a
correctly specified business intent: the problem, the domain, and the rules
that must hold. Liquid inverts the traditional hierarchy accordingly:

1. **The Spec is the executable contract.** The product's durable asset is
   the business intent, the domain, and the specifications written in
   structured Markdown — not the code that happens to implement them today.
2. **Consequential Code is a consequence, not an asset.** The physical code
   generated inside `apps/` is disposable and regenerable at any moment from
   the Specs that describe it. Losing it is not losing the product; losing
   the Specs is.

This is not a claim that code doesn't matter. It is a claim about which
artifact is durable when generating correct code stops being the hard part.

## Conceptually-strict DDD: what stays, what goes

Liquid keeps Domain-Driven Design, but removes its usual coupling to
persistence. In this method, DDD modelling stops being a map of database
tables or ORM schemas and applies strictly at the conceptual level. What the
method keeps:

- **Bounded Context** — the limits of where one business rule begins and
  ends.
- **Ubiquitous Language** — the exact terms business and AI agents must
  share. The [Glossary](../glossary/) on this site is Liquid's own instance
  of this: it is the Ubiquitous Language of the method itself.
- **Entities and Domain Invariants** — the system's core, non-negotiable
  behaviour, where a real one exists.
- **Domain Events** — what happens, and who must react, when a critical
  state changes.

What the method explicitly leaves out of this modelling layer:
implementation details — persistence, ORM choice, SQL schemas. The human's
role is to design and steer business intent; the AI agent's role — the
Domain Enabler — is to infer the best technical implementation that
satisfies that intent, not the other way around.

{{< callout label="Not every product has a rich domain, and that is fine" >}}
A conceptually-strict DDD scope produces an honest consequence: some epics
genuinely have no domain to model — no transaction, no state mutation, no
entity lifecycle. This method's own rule is that a `plan.md` may declare that
absence explicitly, with justification, as a legitimate outcome of modelling
rather than a failure of it. This site — a static publication with no
business transactions — is itself built under that rule. See the
[Lifecycle and Roles](../lifecycle-and-roles/) page for how the Definition of
Done adapts to this case.
{{< /callout >}}

## Why this matters in practice

A method that let AI agents invent database schemas from a one-paragraph
prompt would optimise for the part that automation already solved — writing
syntax — while leaving the part that still requires human judgement —
deciding what the system is actually for — unspecified. Conceptually-strict
DDD keeps the human's attention on Bounded Contexts, Ubiquitous Language and
Domain Invariants, and hands the AI agent everything downstream of that
intent.

**Source:** this page's central claims are drawn from `index.md` section 1
("The New Paradigm of Domain-Driven Design (DDD)") and `README.md`, "What is
Spec-Driven Development (Liquid)?" — the two documents that establish the
method's founding thesis.

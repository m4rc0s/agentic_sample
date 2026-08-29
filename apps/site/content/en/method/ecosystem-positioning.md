---
title: "Ecosystem Positioning"
description: "What Liquid shares with, and adds on top of, the wider spec-driven development movement: GitHub Spec-Kit, OpenSpec/SpecDD and The SDD Standard."
lead: "Liquid is not an isolated invention. It is a practical, surgical variation on a movement already underway."
---

The Spec-Driven Development (SDD) and Spec-First movement is not a lone
idea. It represents the current vanguard of agent-guided software
engineering, validated by open initiatives from the global technology
community. Liquid shares their core philosophy — **the spec is the
executable contract, and the code is a consequence** — and adds three
specific things on top of it.

## The reference ecosystem

- **[GitHub Spec-Kit](https://github.com/github/spec-kit)** (`github/spec-kit`) —
  the reference project that standardises the cycle Constitution →
  Specification → Planning → Tasks → Implementation for multiple agent
  platforms (Claude Code, Cursor, Copilot) through sequential routines
  (`/speckit.*`).
- **[OpenSpec / SpecDD](https://specdd.ai)** (`specdd.ai`) — the community
  movement focused on standardised specification file formats and
  governance folders, aimed at mitigating context hallucination in AI
  agents.
- **[The SDD Standard](https://github.com/mmanzini/Spec-driven-development)**
  (`mmanzini/Spec-driven-development`) — open repositories that formalise
  templates for Product Briefs, Steering Docs and Feature Specs.

## What Liquid adds

Liquid's own variation introduces three things on top of that shared
philosophy:

1. **Absolute Isolation by [Workspace](../glossary/) (one container per
   product).** Where many patterns mix contexts or require complex
   structures inside poorly bounded monorepos, Liquid enforces containers
   and sessions strictly isolated per product, shielding the blast radius
   and eliminating Git conflicts between unrelated products.
2. **The Universal [Manifest](../glossary/) (`app_liquid.md`).** An
   agnostic metadata layer for the physical applications inside `apps/`.
   This spares an agent from scanning deep syntax trees to understand a
   given application's stack, purpose and entry point.
3. **Navigation Based on Programmatic [Anchors](../glossary/)
   (`index.md`).** A clean, hierarchical taxonomy replacing fragmented
   naming, optimised specifically for high-precision semantic search and
   low token consumption by LLMs.

With that foundation, Liquid combines the global best practices of
Spec-First development with a method kept lean and strictly focused on
business intent.

{{< callout label="Differential, not competitive" >}}
This page describes what Liquid adds on top of a shared philosophy, not what
any named tool lacks. Spec-Kit, OpenSpec/SpecDD and The SDD Standard are
peers in the same movement, and this manual does not evaluate them — it
situates Liquid relative to them.
{{< /callout >}}

**Source:** this page reproduces `index.md` section 2 ("The Global Reference
Ecosystem and Our Variation (Liquid)") and `README.md`'s "Global References"
section.

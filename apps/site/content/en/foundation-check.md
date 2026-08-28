---
title: "Foundation Check"
description: "A provisional page exercising the base layout, the visual system and the four content components."
lead: "Placeholder page — content ships in features 02 and 03."
---

{{< callout kind="warning" label="Provisional page" >}}
Nothing here is product content. This page exercises the foundation so that the
content features start from something already proven to build, render and pass
verification.
{{< /callout >}}

## What this page proves

It is built by the generator, served under a language-prefixed route, and it
declares exactly one canonical address, a title, a description and a language.
Those are the properties the publication checker enforces on every page.

## Content components

The foundation ships four content components, and no more. Each exists because
the method's own material will need it; nothing here is speculative.

### Code

```bash
hugo --source apps/site
bash apps/site/scripts/check_invariants.sh apps/site/public
```

### Table

| Component | Purpose | Introduced by |
| :--- | :--- | :--- |
| Code block | Commands and configuration excerpts | Epic 02 |
| Table | Comparisons and reference material | Epic 02 |
| Callout | Setting a passage apart from the body text | Epic 02 |
| Figure | Diagrams with a caption | Epic 02 |

### Callout

{{< callout >}}
A callout carries its meaning in its label, never in its colour alone, so it
survives being read without colour perception.
{{< /callout >}}

### Figure

{{< figure caption="**Placeholder diagram.** The build path this foundation establishes." >}}
```text
content ──► build ──► verify ──► [ delivery hook: awaiting hosting decision ]
```
{{< /figure >}}

## Accessibility baseline

Semantic landmarks, a skip link as the first focusable element, visible focus on
every focusable element, adequate contrast in both display modes, and a fluid
layout. These are properties of the foundation, not of any page written on top
of it.

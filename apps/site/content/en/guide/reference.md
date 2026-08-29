---
title: "Scaffold & Checklist Reference"
description: "The three scripts/scaffold.sh commands, each executed for real with the output it actually produces, plus the Definition of Ready and Definition of Done checklists from team_playbook.md."
lead: "Nothing on this page was written from memory. Every command was run in a disposable copy outside the repository before this page was published."
---

## The three `scaffold.sh` commands

`scripts/scaffold.sh` takes one of three commands. Each was executed in a
throwaway copy of this repository, outside this working tree, specifically
to document real output rather than a description of expected behaviour.
The example name used in each real run is shown here as `<feature-name>`,
`<epic-name>` and `<app-name>` — the same placeholder convention the script's
own `--help` output uses — so this reference page does not itself plant a
phantom repository path that a link checker would have to chase.

### `feature` — create a new Feature

```bash
./scripts/scaffold.sh feature <feature-name>
```

```text
🚀 Criando feature '<feature-name>'...
✅ Feature '<feature-name>' criada com sucesso em features/<feature-name>
👉 Próximo passo: edite <workspace-root>/features/<feature-name>/index.md e defina o escopo de negócio.
```

Files produced:

```text
<feature-name>/index.md
<feature-name>/feat_roadmap.md
<feature-name>/quick_status.md
<feature-name>/epics/_template_epic/index.md
<feature-name>/epics/_template_epic/plan.md
<feature-name>/epics/_template_epic/tasks.md
<feature-name>/epics/_template_epic/quick_status.md
<feature-name>/epics/_template_epic/epic_roadmap.md
```

*(all paths above are relative to `features/`)*

{{< callout kind="warning" label="Remove the orphaned _template_epic" >}}
The `feature` command copies `_template_epic/` into every new Feature's
`epics/` folder as a starting point — it is not a real Epic. Delete it (or
rename it into your first real Epic) before running `scaffold.sh epic`,
otherwise it survives in `quick_status.md` panels as a phantom entry. This
site's own Features `01` and `03` document doing exactly this in their audit
trails.
{{< /callout >}}

### `epic` — create a new Epic inside a Feature

```bash
./scripts/scaffold.sh epic <feature-name> <epic-name>
```

```text
🚀 Criando épico '<epic-name>' na feature '<feature-name>'...
✅ Épico '<epic-name>' criado com sucesso em features/<feature-name>/epics/<epic-name>
👉 Próximo passo: edite <workspace-root>/features/<feature-name>/epics/<epic-name>/index.md e peça ao Hermes para propor o plan.md.
```

Files produced:

```text
<epic-name>/index.md
<epic-name>/plan.md
<epic-name>/tasks.md
<epic-name>/quick_status.md
<epic-name>/epic_roadmap.md
```

*(all paths above are relative to `features/<feature-name>/epics/`)*

### `app` — initialise a new application in `apps/`

```bash
./scripts/scaffold.sh app <app-name>
```

```text
🚀 Criando aplicação '<app-name>' em apps/...
✅ Aplicação '<app-name>' inicializada em apps/<app-name> com app_liquid.md
👉 Próximo passo: configure a stack homologada em <workspace-root>/apps/<app-name>/app_liquid.md.
```

File produced: a single `app_liquid.md`, relative to `apps/<app-name>/`.

Only the Manifest ships — no source tree, no dependency manifest of any
specific stack. Declare the stack in `app_liquid.md` yourself, identical to
what `technical_agreement.md` section 1 homologates for the workspace. See
[Workspace Anatomy & AI Handcuffs](../../method/workspace-and-guardrails/)
for what the Manifest is for.

{{< figure caption="**Console output is copied verbatim, names genericized.** `<workspace-root>` stands in for the absolute path scaffold.sh prints — it resolves the workspace root wherever you run it from." >}}
```text
scripts/scaffold.sh ──┬─► feature <feature-name>              features/<feature-name>/...
                       ├─► epic <feature-name> <epic-name>     features/<feature-name>/epics/<epic-name>/...
                       └─► app <app-name>                      apps/<app-name>/app_liquid.md
```
{{< /figure >}}

## Definition of Ready (DoR) — cleared to start

An Epic's code execution may only begin once:

- [ ] The epic's `index.md` details the business scope and acceptance criteria.
- [ ] `plan.md` is conceptually modelled with Entities, Domain Invariants and Domain Events, with no ORM coupling.
- [ ] `plan.md` has been explicitly reviewed and approved by the human Tech Lead.
- [ ] `tasks.md` contains atomic, ordered tasks with clear verification criteria.
- [ ] The target application's Manifest (`app_liquid.md`) is up to date.

## Definition of Done (DoD) — cleared to deliver

An Epic is only `Done` when:

- [ ] 100% of the tasks listed in `tasks.md` are checked off `[x]`.
- [ ] The epic's automated verification suite passes in full, with no errors. What that suite *verifies* is defined by the epic's `plan.md`.
- [ ] No code violates the AI Handcuffs in `technical_agreement.md`.
- [ ] The epic's and the feature's local `quick_status.md` are updated with the audit trail.
- [ ] The Git commit follows the Conventional Commits standard.

The full detail behind both checklists — including how the Definition of
Done adapts when a `plan.md` declares no conceptual domain — is in
[Lifecycle and Roles](../../method/lifecycle-and-roles/).

**Source:** the three command transcripts above were captured from real
executions of `scripts/scaffold.sh` on 2026-08-29, in a disposable copy of
this repository outside its working tree — the same verification discipline
`features/01-fundacao-publicacao/index.md` used for its own Hugo build
proof, with the example name genericized to a placeholder for publication.
The two checklists reproduce `team_playbook.md` sections 3 and 4 without
altering any criterion.

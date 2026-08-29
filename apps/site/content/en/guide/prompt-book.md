---
title: "Prompt Book"
description: "The six prompts of the Liquid workflow cycle, in copyable form, reproduced verbatim from .agents/prompts_guide.md."
lead: "Copy, paste, adapt only the bracketed placeholders. Nothing else changed."
---

{{< callout label="A note on language" >}}
The prompt bodies below are reproduced **verbatim** from
`.agents/prompts_guide.md`, which is written in Portuguese — the language of
this repository's entire spec corpus. This site publishes in English, but
translating a prompt's body would make it a paraphrase, not a reproduction,
and the whole point of this page is that what you copy from here is
identical to what the method's own source file defines. Each step's title
and framing are in English; each prompt's body is exactly as written in the
source file. This is the same open language tension already registered in
[`features/01-fundacao-publicacao/index.md`](https://github.com/m4rc0s/agentic_sample/blob/main/features/01-fundacao-publicacao/index.md)
section 6.1 — this page does not resolve it, only carries it consistently.
{{< /callout >}}

## Step 1 — Inception and root context refinement

**Goal:** fill in and validate the root governance of the product.

```text
Com base na ideia do produto [Descrever a ideia geral em 2 parágrafos], atue como Tech Lead e Arquiteto de Software.
Preencha e refine os arquivos de governança na raiz:
1. product_vision.md (Declaração de visão, problema central, personas e métricas)
2. architecture.md (C4 Model conceitual e Bounded Contexts)
3. technical_agreement.md (Stack homologada e restrições inegociáveis)
4. roadmap.md (Fases 0, 1 e 2)

Mantenha o DDD estritamente conceitual sem acoplamento a ORMs ou tabelas SQL.
```

## Step 2 — Outlining a new Feature

**Goal:** create the Feature folder and establish its business scope.

```text
Queremos iniciar a feature [nome-da-feature], cujo objetivo é [descrever o objetivo para o usuário].
1. Crie a estrutura em features/[nome-da-feature]/ utilizando o template oficial.
2. Preencha index.md definindo o escopo, personas impactadas e critérios de aceitação gerais.
3. Elabore o feat_roadmap.md detalhando a lista de épicos necessários para entregar essa feature.
4. Inicialize o quick_status.md da feature.
```

## Step 3 — Epic domain modelling (`plan.md` — Hermes / Domain Agent)

**Goal:** produce the conceptual DDD plan.

```text
Leia o escopo do épico em features/[nome-da-feature]/epics/[nome-do-epico]/index.md e a arquitetura em architecture.md.
Proponha o rascunho completo de plan.md:
- Modele as Entidades de Domínio e Value Objects no nível conceitual.
- Defina todas as Regras de Negócio Invariantes (RN-01, RN-02, ...).
- Especifique os Eventos de Domínio emitidos e seus payloads conceituais.
- Descreva o fluxo dos Casos de Uso principais.

Lembre-se: NÃO inclua tabelas de banco, migrations ou ORMs. Apenas o domínio puro.
```

## Step 4 — Slicing into operational tasks (`tasks.md`)

**Goal:** generate the execution queue for the Task Executor.

```text
Com o plan.md do épico [nome-do-epico] revisado e aprovado, gere a fila atômica de execução em tasks.md:
- Divida em fases: Domínio Puro & Testes Unitários de Invariantes -> Casos de Uso & Eventos -> Interfaces/Adapters -> Auditoria.
- Cada tarefa deve ser atômica, sequencial e conter um critério de verificação claro.
- Aponte para o manifesto apps/[nome-da-app]/app_liquid.md correspondente.
```

## Step 5 — Consequential code execution (Claude Code / Antigravity)

**Goal:** implement disciplined code inside `apps/`.

```text
Atue como o Executor de Código. Leia features/[nome-da-feature]/epics/[nome-do-epico]/tasks.md e o manifesto apps/[nome-da-app]/app_liquid.md.
Execute a próxima tarefa pendente [ex: Task 1.1 e 1.2]:
1. Gere o código consequencial exclusivamente em apps/[nome-da-app]/.
2. Escreva os testes automatizados cobrindo as invariantes de plan.md.
3. Execute a suíte de testes e garanta que todos passem.
4. Atualize o checkbox em tasks.md e o quick_status.md do épico.
```

## Step 6 — Audit and Definition of Done

**Goal:** validate delivery and close the Epic.

```text
Audite o épico [nome-do-epico]:
1. Verifique se todas as tarefas em tasks.md estão marcadas como concluídas [x].
2. Execute todos os testes unitários e de integração da aplicação apps/[nome-da-app]/.
3. Valide se os critérios de aceitação de index.md foram satisfeitos.
4. Se tudo estiver em conformidade, atualize quick_status.md do épico, da feature e da raiz para Done.
```

**Source:** every prompt body above is reproduced without modification from
`.agents/prompts_guide.md`. Step names and goals paraphrase only that
document's section headings, translated into English; the placeholders in
square brackets (`[nome-da-feature]`, `[nome-do-epico]`, `[nome-da-app]`) are
exactly as the source file defines them — fill them in as you would fill in
any template field.

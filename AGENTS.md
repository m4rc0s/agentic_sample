# Agent Instructions (Spec-Driven Development Liquid v1)

Este repositório é governado pela metodologia **Spec-Driven Development (Liquid)**. Ao atuar neste projeto, siga estritamente estas diretrizes:

---

## 🧭 Princípios Fundamentais

1. **A Spec é o Software:** O código-fonte em `apps/` é puramente consequencial e descartável. O patrimônio duradouro do produto reside nas especificações Markdown (`product_vision.md`, `architecture.md`, `features/`).
2. **DDD Estritamente Conceitual:** Ao modelar planos (`plan.md`), NÃO projete tabelas SQL, mapeamentos ORM ou migrations. Modele apenas Entidades, Invariantes e Eventos de Domínio.
3. **Sem "Vibe Coding":** Toda implementação de código deve ser precedida por:
   - Um épico delimitado em `features/[feat]/epics/[epic]/index.md`.
   - Um plano conceitual aprovado em `plan.md`.
   - Uma lista de tarefas atômicas em `tasks.md`.
4. **Governança de Apps (`app_liquid.md`):** Todo serviço em `apps/` deve conter e respeitar seu manifesto descritivo `app_liquid.md`.
5. **Algemas da IA:** Respeite rigorosamente as restrições e convenções homologadas em [`technical_agreement.md`](technical_agreement.md).

---

## ⚡ Fluxo de Trabalho do Agente

1. **Leitura de Contexto:** Antes de qualquer tarefa, leia [`index.md`](index.md), [`architecture.md`](architecture.md) e [`technical_agreement.md`](technical_agreement.md).
2. **Execução de Tarefas:** Execute uma tarefa de [`tasks.md`](features/) por vez, rode a suíte de testes e marque o checkbox `[x]` ao concluir.
3. **Auditoria em Tempo Real:** Atualize [`quick_status.md`](quick_status.md) (local e global) mantendo o rastro de progresso transparente.
4. **Scaffolding:** Utilize `./scripts/scaffold.sh [feature|epic|app] <nome>` para criar novas estruturas.

## Maintaining this file

Keep this file for knowledge useful to almost every future agent session in this project.
Do not repeat what the codebase already shows; point to the authoritative file or command instead.
Prefer rewriting or pruning existing entries over appending new ones.
When updating this file, preserve this bar for all agents and keep entries concise.

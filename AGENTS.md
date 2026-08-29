# Universal Agent Instructions (Spec-Driven Development Liquid v1)

Este repositório é governado pela metodologia **Spec-Driven Development (Liquid)**. Qualquer agente autônomo de IA (Claude Code, Antigravity, Hermes, Cursor, Copilot, Codex, etc.) atuando neste workspace DEVE seguir estritamente as diretrizes abaixo:

---

## 🧭 Princípios Fundamentais

1. **A Spec é o Software:** O código-fonte em `apps/` é puramente consequencial e descartável. O patrimônio duradouro do produto reside nas especificações Markdown ([`product_vision.md`](product_vision.md), [`architecture.md`](architecture.md), [`features/`](features/README.md)).
2. **DDD Estritamente Conceitual no `plan.md`:** Ao modelar planos de domínio ([`plan.md`](features/_template_feature/epics/_template_epic/plan.md)), NÃO projete tabelas SQL, mapeamentos ORM ou migrations. Modele apenas Entidades, Value Objects, Invariantes e Eventos de Domínio. Modelos físicos de persistência (tabelas, tipos SQL, migrations, DTOs) devem ser detalhados exclusivamente no planejamento operacional de tarefas ([`tasks.md`](features/_template_feature/epics/_template_epic/tasks.md)) e implementados na camada de adaptadores em `apps/`.
3. **Sem "Vibe Coding":** Toda implementação de código deve ser precedida por:
   - Um épico delimitado em `features/[feat]/epics/[epic]/index.md`.
   - Um plano conceitual aprovado em `plan.md`.
   - Uma lista de tarefas atômicas em `tasks.md`.
4. **Governança de Apps (`app_liquid.md`):** Todo serviço em `apps/` deve conter e respeitar seu manifesto descritivo `app_liquid.md`.
5. **Algemas da IA:** Respeite rigorosamente as restrições e convenções homologadas em [`techinal_deal.md`](techinal_deal.md).

---

## ⚡ Fluxo de Trabalho Operacional do Agente

1. **Leitura de Contexto:** Antes de iniciar qualquer tarefa, leia obrigatoriamente:
   - [`index.md`](index.md) (Governança e ancoragem do workspace)
   - [`product_vision.md`](product_vision.md) (Visão e objetivos de negócio)
   - [`architecture.md`](architecture.md) (Topologia de sistemas e C4 Model)
   - [`techinal_deal.md`](techinal_deal.md) (Restrições de stack, algemas da IA e convenções)
2. **Execução de Tarefas:** Execute uma tarefa de [`tasks.md`](features/) por vez, execute a suíte de testes automatizados e marque o checkbox `[x]` somente quando todos os testes passarem com sucesso.
3. **Auditoria em Tempo Real:** Mantenha o rastro de progresso transparente atualizando [`quick_status.md`](quick_status.md) (local do épico e global da raiz).
4. **Scaffolding:** Utilize `./scripts/scaffold.sh [feature|epic|app] <nome>` para gerar novas estruturas padronizadas.

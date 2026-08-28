# Guide de Prompts do Ciclo Liquid (Prompt Book) 📖

Este documento contém os prompts padronizados para guiar os agentes de IA em cada etapa do ciclo de vida **Spec-Driven Development (Liquid)**.

---

## 🟢 Etapa 1: Inception e Refinamento do Contexto Raiz

**Objetivo:** Preencher e validar a governança na raiz do produto.

```text
Com base na ideia do produto [Descrever a ideia geral em 2 parágrafos], atue como Tech Lead e Arquiteto de Software.
Preencha e refine os arquivos de governança na raiz:
1. product_vision.md (Declaração de visão, problema central, personas e métricas)
2. architecture.md (C4 Model conceitual e Bounded Contexts)
3. technical_agreement.md (Stack homologada e restrições inegociáveis)
4. roadmap.md (Fases 0, 1 e 2)

Mantenha o DDD estritamente conceitual sem acoplamento a ORMs ou tabelas SQL.
```

---

## 🟡 Etapa 2: Delineamento de Nova Feature

**Objetivo:** Criar a pasta da feature e estabelecer o escopo de negócio.

```text
Queremos iniciar a feature [nome-da-feature], cujo objetivo é [descrever o objetivo para o usuário].
1. Crie a estrutura em features/[nome-da-feature]/ utilizando o template oficial.
2. Preencha index.md definindo o escopo, personas impactadas e critérios de aceitação gerais.
3. Elabore o feat_roadmap.md detalhando a lista de épicos necessários para entregar essa feature.
4. Inicialize o quick_status.md da feature.
```

---

## 🔵 Etapa 3: Modelagem de Domínio do Épico (`plan.md` - Hermes / Domain Agent)

**Objetivo:** Gerar o plano conceitual de DDD.

```text
Leia o escopo do épico em features/[nome-da-feature]/epics/[nome-do-epico]/index.md e a arquitetura em architecture.md.
Proponha o rascunho completo de plan.md:
- Modele as Entidades de Domínio e Value Objects no nível conceitual.
- Defina todas as Regras de Negócio Invariantes (RN-01, RN-02, ...).
- Especifique os Eventos de Domínio emitidos e seus payloads conceituais.
- Descreva o fluxo dos Casos de Uso principais.

Lembre-se: NÃO inclua tabelas de banco, migrations ou ORMs. Apenas o domínio puro.
```

---

## 🟣 Etapa 4: Fatiamento em Tarefas Operacionais (`tasks.md`)

**Objetivo:** Gerar a fila de execução para o agente executor.

```text
Com o plan.md do épico [nome-do-epico] revisado e aprovado, gere a fila atômica de execução em tasks.md:
- Divida em fases: Domínio Puro & Testes Unitários de Invariantes -> Casos de Uso & Eventos -> Interfaces/Adapters -> Auditoria.
- Cada tarefa deve ser atômica, sequencial e conter um critério de verificação claro.
- Aponte para o manifesto apps/[nome-da-app]/app_liquid.md correspondente.
```

---

## 🔴 Etapa 5: Execução de Código Consequencial (Claude Code / Antigravity)

**Objetivo:** Codificar de forma disciplinada dentro de `apps/`.

```text
Atue como o Executor de Código. Leia features/[nome-da-feature]/epics/[nome-do-epico]/tasks.md e o manifesto apps/[nome-da-app]/app_liquid.md.
Execute a próxima tarefa pendente [ex: Task 1.1 e 1.2]:
1. Gere o código consequencial exclusivamente em apps/[nome-da-app]/.
2. Escreva os testes automatizados cobrindo as invariantes de plan.md.
3. Execute a suíte de testes e garanta que todos passem.
4. Atualize o checkbox em tasks.md e o quick_status.md do épico.
```

---

## ⚪ Etapa 6: Auditoria e Definition of Done (DoD)

**Objetivo:** Validar a entrega e fechar o épico.

```text
Audite o épico [nome-do-epico]:
1. Verifique se todas as tarefas em tasks.md estão marcadas como concluídas [x].
2. Execute todos os testes unitários e de integração da aplicação apps/[nome-da-app]/.
3. Valide se os critérios de aceitação de index.md foram satisfeitos.
4. Se tudo estiver em conformidade, atualize quick_status.md do épico, da feature e da raiz para Done.
```

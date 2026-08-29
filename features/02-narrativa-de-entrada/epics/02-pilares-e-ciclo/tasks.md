# Tasks: 02-pilares-e-ciclo

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Os Três Pilares

- [x] **Task 1.1 — Escrever a seção "What's different" em `apps/site/content/en/_index.md`:** Tabela Markdown com os três pilares de `README.md:21-25`, na tradução já fixada por `apps/site/content/en/method/ecosystem-positioning.md` (Isolamento Absoluto por Workspace, Manifesto Universal `app_liquid.md`, Âncoras Programáticas `index.md`), cada um linkando o termo do glossário correspondente.
  - *Critério de Verificação:* build sem erro; a tabela renderiza via `layouts/_markup/render-table.html` já existente, sem componente novo.

### Fase 2: O Ciclo de Sete Etapas

- [x] **Task 2.1 — Escrever a seção "How work moves" em `apps/site/content/en/_index.md`:** Lista ordenada Markdown com as sete etapas de `README.md:130-138` (Governança Raiz, Definição de Feature, Modelagem de Domínio, Validação Humana, Fila Operacional, Execução Consequencial, Auditoria Contínua), cada uma citando o arquivo correspondente e linkando termos do glossário quando aplicável.
  - *Critério de Verificação:* leitura lado a lado com o fluxograma de `README.md:130-138` confirma as sete etapas, na ordem, sem omissão.

### Fase 3: Verificação

- [x] **Task 3.1 — Rodar a suíte completa:** `check_invariants.sh` e `check_vocabulary.sh` sobre o site construído com as duas seções.
  - *Critério de Verificação:* ambos terminam com código de saída `0`.
- [x] **Task 3.2 — Confirmar ausência de componente visual novo:** `git status` e inspeção de `apps/site/layouts/` confirmam que nenhum arquivo novo foi adicionado a `_shortcodes/` ou `_partials/`.
  - *Critério de Verificação:* nenhum arquivo novo em `layouts/_shortcodes/` ou `layouts/_partials/`.
- [x] **Task 3.3 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 3.4 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

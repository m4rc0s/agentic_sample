# Tasks: 03-chamadas-para-acao-e-provas

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Chamadas para Ação com Destino Real

- [x] **Task 1.1 — Escrever a seção "Where to go next" em `apps/site/content/en/_index.md`:** Duas CTAs — "Understand the method" apontando para `method/` (relativo, resolve para `/en/method/`), "See the repository" apontando para o endereço do repositório público já usado no rodapé global (`hugo.toml` `params.repository`).
  - *Critério de Verificação:* build sem erro; os dois links resolvem para páginas existentes.

### Fase 2: Tratamento Honesto de `04`/`05`

- [x] **Task 2.1 — Escrever o callout "Open decisions":** Explicar, sem link e sem caminho de arquivo, que as CTAs "começar agora" (feature `04`) e "prova viva" (feature `05`) foram omitidas por não existirem ainda, referenciando a decisão registrada em `../../index.md` §6.1 sem repetir caminho de arquivo específico dessas duas features.
  - *Critério de Verificação:* busca textual na página construída não encontra `features/04` nem `features/05` nem qualquer rota para elas.

### Fase 3: Verificação

- [x] **Task 3.1 — Rodar a suíte completa:** `check_invariants.sh` e `check_vocabulary.sh` sobre o site construído com a home completa (os três épicos desta feature).
  - *Critério de Verificação:* ambos terminam com código de saída `0`.
- [x] **Task 3.2 — Verificação negativa de INV-02:** Confirmar manualmente, com `grep`, que o HTML construído da home não contém `04-guia-de-adocao` nem `05-prova-viva` como caminho ou rota.
  - *Critério de Verificação:* `grep` não encontra ocorrência.
- [x] **Task 3.3 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 3.4 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

# Tasks: 02-paradigma-spec-como-software

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Página do Paradigma

- [x] **Task 1.1 — Escrever `apps/site/content/en/method/paradigm.md`:** Explicar a inversão spec/código (`README.md` §"O Que é...", `index.md` §1) e o recorte de "DDD Estritamente Conceitual" com o que fica explicitamente fora (ORM, SQL, migrations). Usar apenas os termos já definidos no glossário, com a tradução publicada lá — nenhuma redefinição local.
  - *Critério de Verificação:* build sem erro; página acessível em `public/en/method/paradigm/`.
- [x] **Task 1.2 — Citar a fonte da tese (INV-04.a):** Incluir, de forma explícita no texto, referência aos documentos de origem (`index.md`, `README.md`).
  - *Critério de Verificação:* leitura manual confirma a citação; `check_invariants.sh` confirma que os arquivos citados existem (INV-04.b/INV-02.b).

### Fase 2: Verificação

- [x] **Task 2.1 — Rodar a suíte completa:** `check_invariants.sh` e `check_vocabulary.sh` sobre o site construído com a nova página.
  - *Critério de Verificação:* ambos terminam com código de saída `0`.
- [x] **Task 2.2 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 2.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

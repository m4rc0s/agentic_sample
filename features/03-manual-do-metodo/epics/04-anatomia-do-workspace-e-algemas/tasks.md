# Tasks: 04-anatomia-do-workspace-e-algemas

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Página da Anatomia e das Algemas

- [x] **Task 1.1 — Escrever `apps/site/content/en/method/workspace-and-guardrails.md`:** Mapear os arquivos de raiz, `features/`, `epics/`, `apps/`, `assets/` (tabela, componente já existente), explicar a função das âncoras `index.md` em cada nível, e listar as Algemas da IA de `technical_agreement.md` §2 com o porquê de cada uma.
  - *Critério de Verificação:* build sem erro; mapa confere com a estrutura real do repositório.
- [x] **Task 1.2 — Citar a fonte (INV-04.a):** Referenciar `index.md`, `README.md` e `technical_agreement.md` explicitamente no texto.
  - *Critério de Verificação:* `check_invariants.sh` confirma que os arquivos citados existem (INV-02.b/INV-04.b).

### Fase 2: Verificação

- [x] **Task 2.1 — Rodar a suíte completa:** `check_invariants.sh` e `check_vocabulary.sh` sobre o site construído com a nova página.
  - *Critério de Verificação:* ambos terminam com código de saída `0`.
- [x] **Task 2.2 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 2.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

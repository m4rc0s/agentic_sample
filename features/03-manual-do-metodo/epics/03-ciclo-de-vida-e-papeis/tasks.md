# Tasks: 03-ciclo-de-vida-e-papeis

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Página do Ciclo de Vida e Papéis

- [x] **Task 1.1 — Escrever `apps/site/content/en/method/lifecycle-and-roles.md`:** Reproduzir as seis etapas de `index.md` §4, a matriz de papéis de `team_playbook.md` §1 (como tabela, componente já existente), e o DoR/DoD completo de `team_playbook.md` §3–§4, incluindo a emenda §4.1 sobre épicos sem domínio conceitual.
  - *Critério de Verificação:* build sem erro; conferência linha a linha contra as fontes não encontra divergência de sentido.
- [x] **Task 1.2 — Citar a fonte (INV-04.a):** Referenciar `index.md` e `team_playbook.md` explicitamente no texto.
  - *Critério de Verificação:* `check_invariants.sh` confirma que os arquivos citados existem (INV-02.b/INV-04.b).

### Fase 2: Verificação

- [x] **Task 2.1 — Rodar a suíte completa:** `check_invariants.sh` e `check_vocabulary.sh` sobre o site construído com a nova página.
  - *Critério de Verificação:* ambos terminam com código de saída `0`.
- [x] **Task 2.2 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 2.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

# Tasks: 05-posicionamento-no-ecossistema

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Página de Posicionamento

- [x] **Task 1.1 — Escrever `apps/site/content/en/method/ecosystem-positioning.md`:** Descrever GitHub Spec-Kit, OpenSpec/SpecDD e The SDD Standard com links vivos, e situar os três pilares diferenciais do Liquid contra elas, em tom diferencial, nunca de confronto a ferramenta nomeada.
  - *Critério de Verificação:* build sem erro; os três links externos resolvem para os projetos corretos (conferência manual, fora do escopo do checker, que não valida endereços externos).
- [x] **Task 1.2 — Citar a fonte (INV-04.a):** Referenciar `index.md` e `README.md` explicitamente no texto.
  - *Critério de Verificação:* `check_invariants.sh` confirma que os arquivos citados existem (INV-02.b/INV-04.b).

### Fase 2: Verificação

- [x] **Task 2.1 — Rodar a suíte completa:** `check_invariants.sh` e `check_vocabulary.sh` sobre o site construído com a nova página.
  - *Critério de Verificação:* ambos terminam com código de saída `0`.
- [x] **Task 2.2 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 2.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico — o último desta feature.

# Tasks: 03-referencia-de-scaffold-e-checklists

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo desta feature onde nome de stack, caminho de arquivo e comando aparecem. O escopo de negócio vive em [`../../index.md`](../../index.md) e o resultado da modelagem conceitual em [`plan.md`](plan.md).

---

## 📋 Fila Sequencial de Execução

### Fase 1: Execução Real dos Comandos

- [x] **Task 1.1 — Executar `scaffold.sh feature`, `epic` e `app` em cópia fora do repositório:** Copiar `features/`, `apps/` e `scripts/` para um diretório de scratchpad fora desta árvore de trabalho e rodar, nessa cópia, `./scripts/scaffold.sh feature demo-feature`, `./scripts/scaffold.sh epic demo-feature demo-epic` e `./scripts/scaffold.sh app demo-app`, capturando a saída de console de cada um.
  - *Critério de Verificação:* os três comandos terminam com código de saída 0 na cópia; a saída de console de cada um foi capturada integralmente.
- [x] **Task 1.2 — Registrar a árvore de arquivos gerada por cada comando:** Rodar `find` sobre cada diretório gerado (`features/demo-feature`, `features/demo-feature/epics/demo-epic`, `apps/demo-app`) e registrar a lista exata de arquivos.
  - *Critério de Verificação:* a lista de arquivos publicada na página corresponde exatamente à saída de `find` capturada.

### Fase 2: Criação da Página

- [x] **Task 2.1 — Escrever `apps/site/content/en/guide/reference.md`:** Publicar os três comandos, a saída real de console de cada um (Task 1.1), a árvore de arquivos gerada (Task 1.2), e os checklists de Definition of Ready e Definition of Done reproduzidos de `team_playbook.md` §3–4.
  - *Critério de Verificação:* `hugo --source apps/site` gera `apps/site/public/en/guide/reference/index.html`.

### Fase 3: Verificação da Entrega

- [x] **Task 3.1 — Conferir os checklists contra o original:** Comparar cada item de DoR e DoD publicado com o item correspondente em [`team_playbook.md`](../../../../team_playbook.md) §3–4.
  - *Critério de Verificação:* nenhum item publicado altera o critério original — tradução para inglês sem paráfrase que amoleça ou endureça a exigência.
- [x] **Task 3.2 — Construir e verificar o site completo:** Rodar `hugo --source apps/site`, depois `bash apps/site/scripts/check_invariants.sh apps/site/public` e `bash apps/site/scripts/check_vocabulary.sh apps/site/public`.
  - *Critério de Verificação:* os dois checkers terminam com código de saída 0 sobre o site completo da feature `04`.

### Fase 4: Fechamento e Auditoria

- [x] **Task 4.1 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local, o da feature e o radar global da raiz.
- [x] **Task 4.2 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico e da feature completa.

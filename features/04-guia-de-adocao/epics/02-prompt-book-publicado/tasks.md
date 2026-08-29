# Tasks: 02-prompt-book-publicado

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo desta feature onde nome de stack, caminho de arquivo e comando aparecem. O escopo de negócio vive em [`../../index.md`](../../index.md) e o resultado da modelagem conceitual em [`plan.md`](plan.md).

---

## 📋 Fila Sequencial de Execução

### Fase 1: Extração Fiel

- [x] **Task 1.1 — Extrair o corpo literal dos seis prompts:** Copiar, sem editar, o conteúdo de cada bloco ` ```text ` das seis etapas de [`.agents/prompts_guide.md`](../../../../.agents/prompts_guide.md) para blocos de código Markdown na nova página.
  - *Critério de Verificação:* comparação caractere por caractere entre cada bloco extraído e o bloco original não mostra divergência.

### Fase 2: Criação da Página

- [x] **Task 2.1 — Escrever `apps/site/content/en/guide/prompt-book.md`:** Publicar as seis etapas na ordem original, com título e objetivo de cada uma traduzidos para inglês, e o corpo de cada prompt em português, verbatim, dentro de um bloco de código copiável. Incluir a nota sobre a tensão de idioma registrada em [`plan.md`](plan.md) §1.2.
  - *Critério de Verificação:* `hugo --source apps/site` gera `apps/site/public/en/guide/prompt-book/index.html`.

### Fase 3: Verificação de Fidelidade e da Entrega

- [x] **Task 3.1 — Conferir a fidelidade dos seis prompts publicados:** Comparar, um a um, o corpo de cada prompt publicado com o texto de [`.agents/prompts_guide.md`](../../../../.agents/prompts_guide.md).
  - *Critério de Verificação:* os seis prompts são idênticos, sem nenhuma palavra trocada, resumida ou reformulada.
- [x] **Task 3.2 — Construir e verificar o site completo:** Rodar `hugo --source apps/site`, depois `bash apps/site/scripts/check_invariants.sh apps/site/public` e `bash apps/site/scripts/check_vocabulary.sh apps/site/public`.
  - *Critério de Verificação:* os dois checkers terminam com código de saída 0 sobre o site já contendo o conteúdo desta feature.

### Fase 4: Fechamento e Auditoria

- [x] **Task 4.1 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local, o da feature e o radar global da raiz.
- [x] **Task 4.2 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

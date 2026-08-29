# Tasks: 01-quickstart-do-zero-ao-primeiro-epico

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo desta feature onde nome de stack, caminho de arquivo e comando aparecem. O escopo de negócio vive em [`../../index.md`](../../index.md) e o resultado da modelagem conceitual em [`plan.md`](plan.md).

---

## 📋 Fila Sequencial de Execução

### Fase 1: Verificação da Fonte

- [x] **Task 1.1 — Verificar o estado real de `AGENTS.md` e `CLAUDE.md`:** Ler os dois arquivos como existem hoje em `main` e registrar com precisão o que cada um documenta: `AGENTS.md` é universal (instruções para qualquer agente que leia o arquivo); `CLAUDE.md` é um bootstrap específico do Claude Code que aponta para `AGENTS.md`. Nenhum arquivo dedicado existe hoje para Antigravity, Cursor, Copilot ou Hermes especificamente — a lista de `README.md` §1 é uma lista de compatibilidade pretendida, não de instrução entregue.
  - *Critério de Verificação:* a nota redigida na Task 2.2 é conferível linha a linha contra o conteúdo real de `AGENTS.md` e `CLAUDE.md` nesta entrega.
- [x] **Task 1.2 — Conferir os quatro comandos do quickstart contra `README.md`:** Extrair os comandos de `README.md` §"Como Usar Este Template" (criação do workspace, preenchimento do contexto, ativação do agente, scaffold) e confirmar que cada um é reproduzido sem alteração na página publicada.
  - *Critério de Verificação:* `diff` manual entre cada bloco de comando da página e o trecho correspondente de `README.md` não mostra divergência de conteúdo (apenas de formatação Hugo).

### Fase 2: Criação da Seção de Conteúdo

- [x] **Task 2.1 — Criar a seção `guide` e sua página índice:** Criar `apps/site/content/en/guide/_index.md` com front matter (`title`, `description`, `lead`) e um parágrafo de abertura, no mesmo padrão de `apps/site/content/en/method/_index.md`. Adicionar a entrada de menu `Guide` (`pageRef = "/guide"`, peso 4) em `apps/site/hugo.toml`.
  - *Critério de Verificação:* `hugo --source apps/site` gera `apps/site/public/en/guide/index.html`; a entrada `Guide` aparece na navegação primária.
- [x] **Task 2.2 — Escrever `apps/site/content/en/guide/quickstart.md`:** Publicar os quatro passos do caminho feliz (criar o workspace, inicializar o contexto base, subir a sessão do agente, chegar ao primeiro `plan.md` aprovado), com os comandos conferidos na Task 1.2, a nota sobre agentes suportados da Task 1.1, e ao menos uma citação de fonte por passo (INV-04.a).
  - *Critério de Verificação:* `hugo --source apps/site` gera `apps/site/public/en/guide/quickstart/index.html`; a página usa somente os termos do glossário publicado, sem sinônimo proibido.

### Fase 3: Verificação da Entrega

- [x] **Task 3.1 — Construir e verificar o site completo:** Rodar `hugo --source apps/site`, depois `bash apps/site/scripts/check_invariants.sh apps/site/public` e `bash apps/site/scripts/check_vocabulary.sh apps/site/public`.
  - *Critério de Verificação:* os dois checkers terminam com código de saída 0 sobre o site já contendo o conteúdo desta feature.

### Fase 4: Fechamento e Auditoria

- [x] **Task 4.1 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local, o da feature e o radar global da raiz.
- [x] **Task 4.2 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

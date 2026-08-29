# Tasks: 01-tese-e-hero

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Tese e Hero

- [x] **Task 1.1 — Reescrever o front matter de `apps/site/content/en/_index.md`:** Substituir `title`, `description` e `lead` da página de exemplo provisória (feature `01`) pela tese de abertura: "Artificial intelligence did not solve software architecture. It automated the writing of syntax." como `title`, e um `lead` que anuncia a inversão spec/código, reaproveitando a frase de abertura já cunhada em `apps/site/content/en/method/paradigm.md` sem reformulá-la.
  - *Critério de Verificação:* build sem erro; `title` e `lead` renderizam no `<h1>` e no parágrafo `page-lead` da home, acima da dobra.
- [x] **Task 1.2 — Escrever o parágrafo de abertura do corpo:** Um parágrafo conectando a tese do título a "por que isso importa agora" (código deixou de ser escasso), com link para `apps/site/content/en/method/paradigm.md` para quem quer o argumento completo.
  - *Critério de Verificação:* leitura manual confirma que o parágrafo não redefine nenhum termo do glossário, apenas o referencia.

### Fase 2: Verificação

- [x] **Task 2.1 — Rodar a suíte completa:** `check_invariants.sh` e `check_vocabulary.sh` sobre o site construído com a home reescrita.
  - *Critério de Verificação:* ambos terminam com código de saída `0`.
- [x] **Task 2.2 — Verificação visual sem rolagem:** Renderizar a home em `hugo server` e conferir, por captura de tela, que título e `lead` aparecem inteiros na primeira dobra em uma janela desktop (1440×900) e não requerem rolagem para o argumento central.
  - *Critério de Verificação:* captura de tela confirma a tese legível sem rolagem.
- [x] **Task 2.3 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 2.4 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

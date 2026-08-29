# Tasks: 01-modelo-de-conteudo-e-linguagem-ubiqua

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Checker de INV-03.b (Vocabulário)

- [x] **Task 1.1 — Criar a lista curada de sinônimos proibidos automatizáveis `apps/site/scripts/forbidden_synonyms.tsv`:** Formato `<termo><TAB><sinônimo proibido>`. Incluir apenas frases sem significado legítimo independente em outro lugar do conteúdo em inglês do site — a lista completa de sinônimos proibidos vive em `plan.md` §5–§6; esta é o subconjunto seguro para busca textual cega.
  - *Critério de Verificação:* arquivo existe, com comentário explicando por que a lista é um subconjunto, não o catálogo completo.
- [x] **Task 1.2 — Criar `apps/site/scripts/check_vocabulary.sh`:** Bash + utilitários POSIX, dependência zero, mesmo padrão de `check_invariants.sh`. Varre toda página HTML construída em busca das frases de `forbidden_synonyms.tsv`, **exceto** a página do glossário (`en/method/glossary/index.html`), que é exempta por documentar os sinônimos proibidos por definição. Códigos de saída: `0` sem violação, `1` com violação, `2` quando a verificação não pôde ser realizada (mesma doutrina de `technical_agreement.md` §4.1).
  - *Critério de Verificação:* `chmod +x` aplicado; script executa sem erro de sintaxe.
- [x] **Task 1.3 — Provar o checker nas duas direções:** Rodar sobre o site íntegro (deve passar) e sobre uma violação semeada temporariamente numa página que não seja o glossário (deve reprovar, identificando a frase e a página), revertendo a semeadura depois.
  - *Critério de Verificação:* passagem limpa com código de saída `0`; reprovação com código de saída `1` e mensagem identificando `INV-03.b`, a frase e a página; nenhuma alteração residual após reverter.

### Fase 2: Página do Glossário (INV-04)

- [x] **Task 2.1 — Criar a seção `apps/site/content/en/method/`:** `_index.md` com layout de lista (herdado de `list.html`), título "The Method" e uma frase de entrada que aponta para o glossário primeiro.
  - *Critério de Verificação:* `hugo --source apps/site` produz `public/en/method/index.html` com exatamente um `rel="canonical"`.
- [x] **Task 2.2 — Escrever `apps/site/content/en/method/glossary.md`:** Publicar os nove termos centrais e os dez termos de apoio de `plan.md` §5–§6, em inglês, com o termo original em português citado por termo, a justificativa de tradução onde aplicável, os sinônimos proibidos e a fonte no repositório. Usar a tabela de resumo e o callout de nota de idioma já disponíveis no sistema visual da feature `01` — nenhum componente novo.
  - *Critério de Verificação:* build sem erro; todo termo do corpus citado como fonte (`index.md`, `README.md`, `team_playbook.md`, `technical_agreement.md`, `features/README.md`) existe de fato no repositório (INV-04.b, verificado por `check_invariants.sh`).
- [x] **Task 2.3 — Registrar a navegação primária para a seção:** Adicionar a entrada "The Method" ao menu principal em `apps/site/hugo.toml`, apontando para `/method`, na sequência depois de "Foundation Check".
  - *Critério de Verificação:* o item aparece na navegação de toda página construída, na mesma posição em todas.

### Fase 3: Verificação de Ponta a Ponta

- [x] **Task 3.1 — Rodar a suíte completa sobre o site construído:** `check_invariants.sh` (INV-01, INV-02, herdados da feature `01`) e `check_vocabulary.sh` (INV-03.b) sobre a mesma saída construída, incluindo a página do glossário.
  - *Critério de Verificação:* ambos os checkers terminam com código de saída `0`.
- [x] **Task 3.2 — Atualização de Status:** Atualizar `quick_status.md` local, o da feature e o radar global da raiz.
- [x] **Task 3.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

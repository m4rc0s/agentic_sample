# Tasks: 03-navegacao-e-rotas

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**  
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Roteamento com Prefixo de Idioma

- [x] **Task 1.1 — Configurar o multilíngue em `apps/site/hugo.toml`:** Declarar o bloco `[languages]` com `en` como idioma padrão, `languageCode` e `weight`, e definir `defaultContentLanguageInSubdir = true` para que o prefixo de idioma valha para **todas** as rotas desde a primeira publicação.
  - *Critério de Verificação:* após `hugo --source apps/site`, toda página de conteúdo está sob `public/en/`; nenhuma página de conteúdo é gerada fora de um prefixo de idioma.

- [x] **Task 1.2 — Conduzir a raiz do site ao idioma padrão:** Garantir que o gerador produza o redirecionamento da raiz para o idioma padrão.
  - *Critério de Verificação:* `apps/site/public/index.html` existe e redireciona para `/en/`.

- [x] **Task 1.3 — Manter `baseURL` parametrizável:** Manter o valor neutro por padrão em `hugo.toml` e verificar que `hugo --baseURL <endereço>` sobrescreve as âncoras canônicas geradas.
  - *Critério de Verificação:* construir com `--baseURL https://example.org/` produz âncoras absolutas com esse prefixo; nenhuma URL de provedor está gravada no repositório.

### Fase 2: Metadados por Página (INV-01)

- [x] **Task 2.1 — Criar o partial de cabeçalho do documento `apps/site/layouts/_partials/head.html`:** Emitir `<title>`, `<meta name="description">` e **exatamente um** `<link rel="canonical">` derivado do endereço permanente da página. Nenhuma página declara âncora à mão.
  - *Critério de Verificação:* `grep -c 'rel="canonical"'` retorna exatamente `1` em cada arquivo `.html` de `apps/site/public/`.

- [x] **Task 2.2 — Declarar o idioma no elemento raiz:** Emitir `lang` em `<html>` a partir do idioma da própria página, em `apps/site/layouts/baseof.html`.
  - *Critério de Verificação:* toda página em `public/en/` declara `lang="en"`; nenhuma página herda idioma de outra.

- [x] **Task 2.3 — Garantir descrição própria em toda página:** Usar a descrição do front matter da página e um resumo derivado do conteúdo como alternativa, de modo que o campo nunca fique vazio.
  - *Critério de Verificação:* nenhuma página construída apresenta `content=""` na meta descrição.

### Fase 3: Navegação e Sumário

- [x] **Task 3.1 — Criar a navegação primária `apps/site/layouts/_partials/nav.html`:** Renderizar o menu declarado em `hugo.toml`, marcando o destino atual para leitores de tela e mantendo os rótulos em inglês.
  - *Critério de Verificação:* a navegação aparece em toda página; o item correspondente à página atual é identificável por atributo semântico, não apenas por cor.

- [x] **Task 3.2 — Criar o sumário de página `apps/site/layouts/_partials/toc.html`:** Renderizar o sumário a partir dos títulos do conteúdo, omitindo-o quando a página não tiver títulos suficientes.
  - *Critério de Verificação:* o sumário aparece numa página com vários títulos e não deixa contêiner vazio numa página sem títulos.

### Fase 4: Fechamento e Auditoria

- [x] **Task 4.1 — Conferir INV-01 manualmente antes de automatizar:** Contar as âncoras canônicas na saída construída e conferir a ausência de duplicatas.
  - *Critério de Verificação:* número de âncoras distintas igual ao número de páginas publicadas. A automação dessa conferência é entregue no épico [`04`](../04-pipeline-de-publicacao-e-verificacao/tasks.md).
- [x] **Task 4.2 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local, o da feature e o radar global da raiz.
- [x] **Task 4.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

# Tasks: 02-sistema-visual-e-layout-base

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**  
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Sistema Visual em CSS Puro

- [x] **Task 1.1 — Criar as escalas e a paleta em `apps/site/assets/css/main.css`:** Definir, como propriedades customizadas CSS em `:root`, a escala tipográfica, a escala de espaçamento e a paleta do modo claro. Sem pré-processador, sem framework, sem `node_modules`.
  - *Critério de Verificação:* nenhum valor de tamanho ou espaçamento aparece fora das escalas declaradas; `apps/site/` não contém `package.json` nem `node_modules/`.

- [x] **Task 1.2 — Definir o modo escuro por preferência de sistema:** Redefinir apenas os tokens de cor sob `@media (prefers-color-scheme: dark)`, preservando as escalas.
  - *Critério de Verificação:* alternar a preferência do sistema operacional muda as cores da página sem recarregar o CSS; nenhuma cor tem sua única definição dentro do bloco de mídia.

- [x] **Task 1.3 — Adicionar o alternador de modo sem framework:** Implementar o alternador em JavaScript nativo embutido, gravando a escolha do visitante e reaplicando-a antes da primeira pintura para não haver piscada. Nenhuma biblioteca externa.
  - *Critério de Verificação:* a escolha sobrevive à navegação entre páginas e a um recarregamento; a página renderiza corretamente com o script bloqueado.

- [x] **Task 1.4 — Verificar contraste nos dois modos:** Medir as combinações de texto corrente, texto secundário e elementos interativos sobre seus fundos, nos dois modos.
  - *Critério de Verificação:* toda combinação medida atinge no mínimo 4,5:1 (WCAG AA, texto normal). Registrar as razões obtidas.

### Fase 2: Layout Base e Partials

- [x] **Task 2.1 — Criar o layout base `apps/site/layouts/baseof.html`:** Estruturar o envelope com os marcos semânticos `header`, `nav`, `main` e `footer`, mais o atalho para o conteúdo principal como primeiro elemento focável do documento.
  - *Critério de Verificação:* a saída construída de qualquer página contém exatamente um `main`; o primeiro elemento focável é o atalho para o conteúdo.

- [x] **Task 2.2 — Criar os partials de cabeçalho e rodapé:** Criar `apps/site/layouts/_partials/header.html` e `footer.html`, consumidos pelo layout base.
  - *Critério de Verificação:* cabeçalho e rodapé aparecem idênticos em todas as páginas construídas.

- [x] **Task 2.3 — Criar os layouts de página `home.html`, `single.html` e `list.html`** em `apps/site/layouts/`, todos herdando o layout base.
  - *Critério de Verificação:* `hugo --source apps/site` constrói sem aviso de template ausente para nenhum tipo de página.

- [x] **Task 2.4 — Servir o CSS pelo pipeline do próprio gerador:** Referenciar `assets/css/main.css` a partir do cabeçalho do documento usando o pipeline de recursos do Hugo, com impressão digital no nome do arquivo. Nenhuma origem externa e nenhuma CDN.
  - *Critério de Verificação:* `grep -rn 'https\?://' apps/site/public --include='*.html'` não retorna nenhuma referência a recurso externo carregado pela página.

### Fase 3: Componentes de Conteúdo

- [x] **Task 3.1 — Estilizar bloco de código e tabela:** Estilizar os elementos gerados a partir do Markdown, com rolagem horizontal contida no próprio elemento para conteúdo largo.
  - *Critério de Verificação:* uma tabela larga e uma linha de código longa rolam dentro do próprio contêiner; o corpo da página nunca rola horizontalmente.

- [x] **Task 3.2 — Criar os componentes de destaque e figura:** Criar `apps/site/layouts/_shortcodes/callout.html` e `figure.html`, com estilo correspondente no CSS.
  - *Critério de Verificação:* ambos renderizam nos dois modos de exibição; o destaque não transmite seu significado apenas por cor.

### Fase 4: Fechamento e Auditoria

- [x] **Task 4.1 — Verificar operação por teclado:** Percorrer a página do primeiro ao último elemento focável.
  - *Critério de Verificação:* foco sempre visível, ordem coerente com a leitura, nenhuma armadilha de foco, atalho para conteúdo funcional.
- [x] **Task 4.2 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local, o da feature e o radar global da raiz.
- [x] **Task 4.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

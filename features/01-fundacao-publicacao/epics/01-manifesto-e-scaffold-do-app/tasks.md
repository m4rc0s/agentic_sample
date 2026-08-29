# Tasks: 01-manifesto-e-scaffold-do-app

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**  
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo desta feature onde nome de stack, caminho de arquivo e comando aparecem. O escopo de negócio vive em [`../../index.md`](../../index.md) e o resultado da modelagem conceitual em [`plan.md`](plan.md).

---

## 📋 Fila Sequencial de Execução

### Fase 1: Registro da Aplicação

- [x] **Task 1.1 — Homologar a stack real nos acordos técnicos:** Substituir os placeholders da tabela de stack em [`technical_agreement.md`](../../../../technical_agreement.md) §1 pela stack real do produto: Hugo `extended` como gerador; Go templates e CSS puro escrito à mão como Frontend/UI; Backend Primário, Framework Web e Banco de Dados como **não aplicável**; checker de invariantes em Bash + utilitários POSIX como camada de testes. Registrar ali a nota de homologação que justifica a dependência zero do checker.
  - *Critério de Verificação:* `grep -n '\[ex:' technical_agreement.md` não retorna nenhuma linha da tabela de stack; a versão alvo registrada é a que a máquina de construção efetivamente usa.

- [x] **Task 1.2 — Criar a aplicação com a ferramenta do método:** Executar `./scripts/scaffold.sh app site`, que cria `apps/site/` a partir do molde e injeta o nome da aplicação no manifesto.
  - *Critério de Verificação:* `apps/site/app_liquid.md` existe e o campo `app_name` já contém `site`.

- [x] **Task 1.3 — Preencher o manifesto `apps/site/app_liquid.md`:** Preencher `app_name`, `app_type`, `tech_stack`, `app_description`, `entrypoint` e `dependencies_scope`. O campo `tech_stack` deve ser **idêntico** à stack homologada na Task 1.1.
  - *Critério de Verificação:* nenhum colchete de molde (`[`…`]`) permanece no arquivo; a lista de tecnologias do manifesto e a da tabela de `technical_agreement.md` §1 coincidem termo a termo.

### Fase 2: Isolamento da Camada Consequencial

- [x] **Task 2.1 — Ignorar as saídas de construção do Hugo:** Acrescentar a `.gitignore`, em seção própria e comentada no estilo das existentes, as entradas `public/`, `resources/_gen/` e `.hugo_build.lock`. Não reordenar nem reescrever o restante do arquivo.
  - *Critério de Verificação:* `git check-ignore -v apps/site/public` aponta para a nova seção; o `git diff` do arquivo mostra apenas linhas acrescentadas ao final.

### Fase 3: Esqueleto que Constrói

- [x] **Task 3.1 — Instalar a ferramenta de construção:** Instalar o Hugo `extended` na máquina de trabalho e registrar a versão obtida.
  - *Critério de Verificação:* `hugo version` reporta uma versão `extended`; a versão reportada é a mesma registrada na Task 1.1.

- [x] **Task 3.2 — Criar a configuração `apps/site/hugo.toml`:** Declarar `title`, `languageCode`, o idioma padrão `en` e `defaultContentLanguageInSubdir = true`. Definir `baseURL` com valor neutro por padrão, sobrescritível por `--baseURL` no momento da construção.
  - *Critério de Verificação:* nenhuma URL de provedor de hospedagem aparece no arquivo; `hugo config --source apps/site` lista `defaultcontentlanguageinsubdir` como `true`.

- [x] **Task 3.3 — Criar a unidade mínima de conteúdo:** Criar `apps/site/content/en/_index.md` com front matter mínimo, apenas para que a construção tenha o que compilar. O conteúdo real é responsabilidade das features `02` e `03`.
  - *Critério de Verificação:* `hugo --source apps/site` termina com código de saída 0 e gera `apps/site/public/en/index.html`.

- [x] **Task 3.4 — Provar que a saída não contamina o controle de versão:** Executar a construção completa e inspecionar o estado do repositório.
  - *Critério de Verificação:* após `hugo --source apps/site`, o comando `git status --porcelain` não lista nenhum arquivo sob `apps/site/public/` nem `apps/site/resources/`.

### Fase 4: Fechamento e Auditoria

- [x] **Task 4.1 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local, o da feature e o radar global da raiz.
- [x] **Task 4.2 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

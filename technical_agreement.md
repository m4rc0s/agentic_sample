# Technical Agreement & Agent Guardrails: [Nome do Produto]

> **Instruções:** Este arquivo é o contrato técnico inegociável entre o Tech Lead humano e os Agentes Autônomos de IA. Qualquer código gerado em `apps/` DEVE obedecer estritamente às restrições e padrões aqui estabelecidos.

---

## 1. Stack Tecnológica Homologada

O produto materializado hoje em `apps/` é um **site estático**: conteúdo Markdown compilado em HTML em tempo de build, servido sem processo de servidor. Camadas que não existem neste produto estão registradas honestamente como **Não aplicável** — declarar tecnologia inexistente para preencher a tabela violaria o próprio método.

| Camada | Tecnologia Homologada | Versão Alvo | Motivo / Restrição |
| :--- | :--- | :--- | :--- |
| **Gerador / Framework** | Hugo (`extended`) | `0.165.0 extended` | Decisão do capitão. Binário único, sem gerenciador de pacotes e sem dependências de runtime — a leitura mais literal do pilar de Isolamento Absoluto por Workspace. A edição `extended` é a homologada e a exigida no CI. |
| **Backend Primário** | **Não aplicável** | — | Site estático: nenhum processo de servidor, nenhuma API, nenhuma execução em tempo de requisição. |
| **Framework Web** | **Não aplicável** | — | Decorre da linha acima: não há camada HTTP própria a ser servida. |
| **Banco de Dados** | **Não aplicável** | — | Nenhum estado é persistido ou mutado. Todo conteúdo é arquivo versionado no Git. |
| **Frontend / UI** | Templates Hugo (Go templates) + CSS puro escrito à mão | Go templates de `0.165.0`; CSS conforme suporte de navegador corrente | **Sem pré-processador, sem framework CSS e sem `node_modules`.** Nenhuma dependência de CDN externa: todo asset é servido do próprio site. |
| **Testes** | Checker de invariantes de publicação em Bash + utilitários POSIX | Bash 4+; `grep`, `sed`, `sort`, `find` (POSIX) | **Dependência zero.** Ver a nota de homologação abaixo. |

### 1.1 Nota de homologação: por que o checker é Bash com dependência zero

Este produto não tem invariantes de negócio (não há transação, mutação de estado nem ciclo de vida de entidade). O que ele tem são **invariantes de publicação** verificáveis, e são elas que cumprem, aqui, o papel da suíte de testes exigida pelo §4 e pelo DoD do [`team_playbook.md`](team_playbook.md):

* **INV-01 (Âncora única):** toda página publicada declara exatamente uma URL canônica, e nenhuma canônica se repete entre páginas distintas.
* **INV-02 (Integridade referencial):** nenhuma página referencia arquivo de governança, feature ou épico que não exista de fato no repositório ou na saída construída.

A escolha de **Bash + utilitários POSIX, com dependência zero**, é derivada direta da escolha do capitão por Hugo. Adotar Hugo pelo argumento do binário único e então introduzir um runtime de testes com gerenciador de pacotes próprio anularia exatamente o isolamento que motivou a escolha. O verificador roda com o que qualquer ambiente POSIX já oferece, e a cadeia de ferramentas do produto inteiro permanece: **um binário (Hugo) e o shell.**

Esta homologação fica registrada aqui — e não escondida dentro de um `tasks.md` — porque é um acordo técnico do produto, não um detalhe de execução de tarefa.

---

## 2. 🛡️ As "Algemas da IA" (Fronteiras e Restrições Inegociáveis)

Os Agentes Autônomos **NUNCA** devem violar as seguintes regras:

### 🚫 Ações Proibidas:
1. **NÃO instalar pacotes ou dependências não homologadas** sem autorização explícita ou registro prévio no manifesto [`apps/*/app_liquid.md`](apps/).
2. **NÃO expor chaves de API, senhas ou tokens** hardcoded em código ou markdowns. Utilize variáveis de ambiente (`.env.example`).
3. **NÃO implementar código sem testes automatizados** para as regras de negócio invariantes descritas em [`plan.md`](features/).
4. **NÃO alterar contratos de API sem atualizar a spec** correspondente da feature.
5. **NÃO realizar "vibe coding" (criação arbitrária de arquivos fora de `apps/` ou sem tarefa associada em `tasks.md`).**

### ✅ Padrões Obrigatórios:
1. **Tratamento Tipado de Erros:** Proibido silenciar exceções (`catch (e) {}` vazio). Todo erro de domínio deve retornar um tipo semântico bem definido.
2. **Imutabilidade e Tipagem Estrita:** Priorize estruturas imutáveis e verificação estrita de tipos em todas as linguagens.
3. **Idempotência:** Handlers de eventos e comandos de mutação de estado devem prever requisições repetidas sem duplicação de dados.
4. **Isolamento de Domínio:** A lógica pura de negócio não deve depender de frameworks web ou ORMs (Arquitetura Limpa / Ports & Adapters).

---

## 3. Padrões de Código e Convenções de Nomenclatura

* **Arquivos e Pastas de Código:** `snake_case` ou `kebab-case` para diretórios e arquivos de acordo com o padrão idiomático da stack.
* **Commits Git:** Padrão *Conventional Commits*:
  - `feat(auth): adiciona fluxo de login com OAuth`
  - `fix(core): corrige cálculo de valor líquido`
  - `docs(spec): atualiza critérios de aceite do épico 01`
  - `test(core): adiciona teste unitário de invariante de saldo`

---

## 4. Estratégia de Testes e Validação

```text
[ Testes Unitários de Domínio ]  ──► 100% de cobertura nas regras de plan.md
[ Testes de Integração de API ]  ──► Validação de contratos HTTP / JSON Schemas
[ Testes de Ponta a Ponta (E2E) ] ──► Cenários críticos de jornada do usuário
```

* **Critério de Aceite Técnico:** Um épico só pode ser marcado como `Done` em `quick_status.md` se todos os testes automatizados da suíte passarem com código de saída 0.

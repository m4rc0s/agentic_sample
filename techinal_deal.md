# Technical Deal & Agent Guardrails: [Nome do Produto]

> **Instruções:** Este arquivo é o contrato técnico inegociável entre o Tech Lead humano e os Agentes Autônomos de IA. Qualquer código gerado em `apps/` DEVE obedecer estritamente às restrições e padrões aqui estabelecidos.

---

## 1. Stack Tecnológica Homologada

| Camada | Tecnologia Homologada | Versão Alvo | Motivo / Restrição |
| :--- | :--- | :--- | :--- |
| **Backend Primário** | [ex: Kotlin (JVM) / Rust / Python / TypeScript / Go] | [ex: Kotlin 2.0 / Node 20+] | [Definição de padrão e robustez] |
| **Framework Web** | [ex: Spring Boot 3 / Axum / FastAPI / Fastify] | [Versão] | [Padrão de API REST] |
| **Banco de Dados** | [ex: PostgreSQL / SQLite / Redis] | [Versão] | [Armazenamento relacional e cache] |
| **Frontend / UI** | [ex: Next.js / React / Vue / Flutter / CLI] | [Versão] | [Interface com usuário] |
| **Testes** | [ex: JUnit 5 / Pytest / Vitest / Cargo test] | [Versão] | [Cobertura de testes automatizados] |

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

* **Branches Git:** Nenhum trabalho entra no branch principal diretamente. Toda mudança nasce em um branch próprio e entra por *Pull Request*. O nome do branch segue o mesmo vocabulário dos commits: `<tipo>/<descrição-em-kebab-case>`.
  - `docs/agentes-e-camadas-de-modelagem`
  - `feat/fluxo-de-login-oauth`
  - `fix/calculo-de-valor-liquido`
* **Pull Requests:** O título do PR obedece ao mesmo padrão *Conventional Commits* aplicado às mensagens de commit:
  - `docs: instrucoes universais de agentes e separacao dos niveis de modelagem`
  - `feat(auth): adiciona fluxo de login com OAuth`

---

## 4. Estratégia de Testes e Validação

```text
[ Testes Unitários de Domínio ]  ──► 100% de cobertura nas regras de plan.md
[ Testes de Integração de API ]  ──► Validação de contratos HTTP / JSON Schemas
[ Testes de Ponta a Ponta (E2E) ] ──► Cenários críticos de jornada do usuário
```

* **Critério de Aceite Técnico:** Um épico só pode ser marcado como `Done` em `quick_status.md` se todos os testes automatizados da suíte passarem com código de saída 0.

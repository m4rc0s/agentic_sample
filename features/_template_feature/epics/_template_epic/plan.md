# Domain Enabler (Conceptual DDD Plan): [Nome do Épico]

> **Instruções para o Agente Hermes / Modelador de Domínio:**  
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, tabelas SQL ou mapeamentos ORM aqui.** Modele o domínio estritamente no nível de negócio (Entidades, Value Objects, Invariantes e Eventos de Domínio). Os modelos físicos (tabelas, DDL, migrations, DTOs e adapters) serão definidos na etapa de fatiamento operacional em `tasks.md`.

---

## 1. Entidades de Domínio e Value Objects (Conceitual)

### Entidade: `[NomeDaEntidade]`
* **Papel no Domínio:** [Qual a identidade e ciclo de vida desta entidade?]
* **Identificador Único:** `[id / uuid / chave natural]`
* **Atributos Conceituais:**
  - `[atributo_1]`: [Tipo conceitual e significado]
  - `[atributo_2]`: [Tipo conceitual e significado]

### Value Object: `[NomeDoValueObject]`
* **Descrição:** [Objeto imutável sem identidade própria definido por seus atributos]
* **Atributos:** `[ex: Moeda, Quantidade, Email, CPF]`

---

## 2. Regras de Negócio Invariantes (Regras Inegociáveis)

As invariantes representam as verdades absolutas que o domínio jamais permite violar:

* **RN-01 (Invariante de Estado):** [ex: O status só pode transicionar de PENDENTE para ATIVO se todos os campos obrigatórios estiverem validados.]
* **RN-02 (Invariante Numérica/Limite):** [ex: O valor da transação deve ser estritamente maior que zero e não pode exceder o saldo disponível.]
* **RN-03 (Invariante de Idempotência):** [ex: Uma requisição com a mesma chave de idempotência não deve gerar duplicidade de processamento.]

---

## 3. Eventos de Domínio (Domain Events)

Eventos emitidos quando transições de estado críticas ocorrem:

| Nome do Evento | Gatilho / Causa | Payload Conceitual | Reagentes / Consumidores |
| :--- | :--- | :--- | :--- |
| `[EntidadeCriada]` | Comando de criação executado com sucesso | `id`, `criado_em`, `payload_resumido` | Módulo de Notificações, Analytics |
| `[EntidadeAtualizada]` | Transição de estado validada | `id`, `estado_anterior`, `novo_estado` | Worker de auditoria |
| `[OperacaoRejeitada]` | Violação de regra de negócio (invariante) | `motivo_rejeicao`, `timestamp` | Observabilidade de erros |

---

## 4. Casos de Uso / Comandos e Consultas (Use Cases)

### Caso de Uso 1: `[ExecutarAcaoPrincipal]`
1. **Entrada:** `[Comando com parâmetros necessários]`
2. **Validações Invariantes:** Verifica RN-01 e RN-02.
3. **Mutação de Estado:** Aplica as alterações na Entidade `[NomeDaEntidade]`.
4. **Disparo de Evento:** Emite `[EntidadeCriada]`.
5. **Saída:** Retorna resultado de sucesso ou erro tipado.

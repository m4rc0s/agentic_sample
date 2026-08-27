# Epic Spec: [Nome do Épico]

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

Descreva o pacote atômico de entrega de valor deste épico dentro da feature:
* **Objetivo Principal:** [Qual a capacidade que este épico habilita?]
* **Bounded Context Relacionado:** [`[Nome do Bounded Context em architecture.md]`]

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Termos de negócio rigorosos que DEVEM ser usados nos contratos, código e testes:

| Termo de Negócio | Definição Semântica | Sinônimos Proibidos (Evitar Alucinações) |
| :--- | :--- | :--- |
| **`[TermoA]`** | [Definição exata do conceito no domínio] | `[TermoGenérico1]`, `[TermoGenérico2]` |
| **`[TermoB]`** | [Definição exata do conceito no domínio] | `[TermoGenérico3]` |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: [Fluxo Principal de Sucesso]
* **Dado que:** [Estado inicial do sistema / Pré-condição válida]
* **Quando:** [O usuário ou sistema executa uma ação de comando]
* **Então:** [O estado do sistema deve transicionar com sucesso]
* **E:** [O evento de domínio correspondente deve ser emitido]

### Cenário 2: [Violação de Regra Invariante / Erro de Domínio]
* **Dado que:** [Estado onde uma regra de negócio seria violada]
* **Quando:** [A ação inválida é solicitada]
* **Então:** [O sistema deve rejeitar a operação com erro tipado explícito]
* **E:** [Nenhum estado deve ser corrompido ou persistido]

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/[nome-da-aplicacao]`](../../../apps/)
* **Manifesto:** [`apps/[nome-da-aplicacao]/app_liquid.md`](../../../apps/)

# Epic Spec: 03-chamadas-para-acao-e-provas

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar, ao final da home, chamadas para ação hierarquizadas para um visitante já convencido pela tese e pelos pilares — e tratar com honestidade as duas chamadas para ação que o relatório de plano original previa ("começar agora", "prova viva") mas que apontariam para features que ainda não existem neste repositório.
* **Bounded Context Relacionado:** **Nenhum próprio.** Consome o Bounded Context modelado no glossário da feature `03` ([`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md)). Ver justificativa completa em [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico não cunha termo novo. Usa, sem redefinir, o termo `Spec`, definido
em
[`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md)
§5.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: A CTA "entender o método" tem destino real
* **Dado que:** a home publica a seção "Where to go next".
* **Quando:** um visitante clica em "Understand the method".
* **Então:** ele chega em `/en/method/`, a página inicial do manual publicado pela feature `03`.

### Cenário 2: A CTA "ver o repositório" tem destino real
* **Dado que:** a home publica a seção "Where to go next".
* **Quando:** um visitante clica em "See the repository".
* **Então:** ele chega no repositório público do projeto, o mesmo endereço já usado no rodapé global do site.

### Cenário 3: Nenhuma referência quebrada às features `04`/`05` (INV-02)
* **Dado que:** as features `04` (guia de adoção) e `05` (prova viva) não existem neste repositório.
* **Quando:** `check_invariants.sh` roda sobre a home publicada.
* **Então:** nenhuma rota interna nem nenhum caminho de arquivo referenciando `04` ou `05` aparece na página — a omissão é total, não um link morto disfarçado.

### Cenário 4: A omissão é documentada, não silenciosa
* **Dado que:** as CTAs para `04` e `05` foram deliberadamente omitidas.
* **Quando:** um visitante ou um agente auditor lê a home até o fim.
* **Então:** um callout "Open decisions" explica que essas duas chamadas para ação existem no plano do produto mas não nesta entrega, e por quê — sem fingir que a decisão não foi tomada.

### Cenário 5: Vocabulário consistente com o glossário (INV-03)
* **Dado que:** o site foi construído com esta seção publicada.
* **Quando:** `check_vocabulary.sh` é executado.
* **Então:** nenhum sinônimo proibido do subconjunto automatizado aparece nesta seção da home.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Seções publicadas:** "Where to go next" (as duas CTAs) e o callout "Open decisions" em `apps/site/content/en/_index.md`.

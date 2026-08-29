# Epic Spec: 03-ciclo-de-vida-e-papeis

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar, com fidelidade ao que já está homologado no repositório, as etapas do ciclo de trabalho do agente, a matriz de papéis humano/agente, e o Definition of Ready e Definition of Done — para que um avaliador saiba exatamente onde a decisão humana entra e onde o agente atua sozinho, sem abrir `index.md` ou `team_playbook.md`.
* **Bounded Context Relacionado:** **Nenhum próprio.** Consome o glossário. Ver [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Nenhum termo novo. Usa `Ubiquitous Language`, `Chief Architect / Tech Lead`, `Domain Enabler`, `Task Executor`, `Reviewer & QA`, `Definition of Ready (DoR)` e `Definition of Done (DoD)`, definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §6.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: O ciclo reproduz fielmente as seis etapas
* **Dado que:** `index.md` §4 lista seis etapas do fluxo de trabalho do agente.
* **Quando:** a página publicada é comparada linha a linha.
* **Então:** as seis etapas aparecem, na mesma ordem e sem alteração de sentido.

### Cenário 2: Os papéis humano/agente estão corretos
* **Dado que:** `team_playbook.md` §1 define quatro papéis com atribuições específicas.
* **Quando:** a página publicada é examinada.
* **Então:** os quatro papéis aparecem com as mesmas atribuições, sem invenção de responsabilidade nova.

### Cenário 3: DoR e DoD estão publicados por completo
* **Dado que:** `team_playbook.md` §3 e §4 definem checklists de Definition of Ready e Definition of Done.
* **Quando:** a página publicada é examinada.
* **Então:** ambos os checklists aparecem completos, incluindo a emenda de §4.1 sobre épicos sem domínio conceitual.

### Cenário 4: Vocabulário e rastreabilidade (INV-03, INV-04)
* **Dado que:** o site foi construído com esta página publicada.
* **Quando:** `check_vocabulary.sh` e `check_invariants.sh` são executados.
* **Então:** ambos passam, e a página cita `index.md` e `team_playbook.md` como fonte.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Página publicada:** `apps/site/content/en/method/lifecycle-and-roles.md`

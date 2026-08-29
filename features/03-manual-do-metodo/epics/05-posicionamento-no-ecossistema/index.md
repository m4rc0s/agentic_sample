# Epic Spec: 05-posicionamento-no-ecossistema

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar o que o Liquid partilha e o que acrescenta frente a GitHub Spec-Kit, OpenSpec/SpecDD e The SDD Standard, com links vivos para as três iniciativas, para que um avaliador não julgue o método como se fosse uma invenção isolada.
* **Bounded Context Relacionado:** **Nenhum próprio.** Ver [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Nenhum termo novo. Usa `Workspace`, `Manifest` e `Anchor`, definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: As três iniciativas de referência estão descritas corretamente
* **Dado que:** `index.md` §2 descreve GitHub Spec-Kit, OpenSpec/SpecDD e The SDD Standard.
* **Quando:** a página publicada é comparada com essa descrição.
* **Então:** cada iniciativa é descrita sem distorção, com link vivo para o projeto real.

### Cenário 2: O posicionamento é diferencial, não confronto
* **Dado que:** a página descreve o que o Liquid acrescenta.
* **Quando:** o texto é lido por completo.
* **Então:** nenhuma ferramenta de terceiros nomeada é criticada; a comparação é sempre em termos do que o Liquid soma, não do que a outra falta.

### Cenário 3: Vocabulário e rastreabilidade (INV-03, INV-04)
* **Dado que:** o site foi construído com esta página publicada.
* **Quando:** `check_vocabulary.sh` e `check_invariants.sh` são executados.
* **Então:** ambos passam, e a página cita `index.md` e `README.md` como fonte.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Página publicada:** `apps/site/content/en/method/ecosystem-positioning.md`

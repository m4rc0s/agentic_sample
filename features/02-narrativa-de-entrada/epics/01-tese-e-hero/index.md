# Epic Spec: 01-tese-e-hero

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar a proposição de abertura do método e a primeira dobra da home: a tese de que a IA não resolveu a arquitetura de software, ela automatizou a escrita de sintaxe — compreensível por um visitante que nunca ouviu falar do Liquid, sem que ele precise rolar a página, em desktop ou mobile.
* **Bounded Context Relacionado:** **Nenhum próprio.** Consome o Bounded Context modelado no glossário canônico da feature `03` ([`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md)). Ver justificativa completa em [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico não cunha termo novo. Usa, sem redefinir, os termos `Spec` e
`Consequential Code`, definidos em
[`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md)
§5.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: A tese central é compreensível sem rolagem
* **Dado que:** um visitante que nunca ouviu falar do Liquid abre a home, em desktop ou em mobile.
* **Quando:** a página carrega, sem qualquer interação do visitante.
* **Então:** o título e o parágrafo de abertura, visíveis sem rolar, comunicam a tese completa: a IA automatizou a escrita de sintaxe, não a arquitetura, e a especificação — não o código — é o patrimônio duradouro do método.

### Cenário 2: A tese não contradiz o que o manual já publicou
* **Dado que:** a home apresenta a tese de abertura.
* **Quando:** o visitante compara essa apresentação com a página "The Paradigm" do manual (feature `03`, épico `02`).
* **Então:** nenhuma afirmação da home contradiz o argumento já publicado ali — a home anuncia a tese, o manual a aprofunda (INV-05).

### Cenário 3: Vocabulário consistente com o glossário (INV-03)
* **Dado que:** o site foi construído com esta seção publicada.
* **Quando:** `check_vocabulary.sh` é executado.
* **Então:** nenhum sinônimo proibido do subconjunto automatizado aparece nesta seção da home.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Seção publicada:** front matter (`title`, `description`, `lead`) e o primeiro parágrafo de `apps/site/content/en/_index.md`.

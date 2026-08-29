# Epic Spec: 02-paradigma-spec-como-software

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar a tese aprofundada do método: por que a spec é o software e o código é consequência, e o que significa, na prática, "DDD Estritamente Conceitual" — incluindo o que fica explicitamente de fora (ORM, SQL, migrations). É a página que transforma a inversão de hierarquia, já anunciada em uma frase na home (feature `02`, fora do escopo deste trabalho), em argumento completo.
* **Bounded Context Relacionado:** **Nenhum próprio.** Consome o Bounded Context modelado no glossário ([`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md)). Ver justificativa completa em [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico não cunha termo novo. Usa, sem redefinir, os termos `Spec`, `Consequential Code`, `Conceptually-Strict DDD`, `Domain Invariant`, `Domain Event`, `Bounded Context` e `Ubiquitous Language`, definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5–§6.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: A tese central é explicada, não apenas anunciada
* **Dado que:** um visitante que já leu a home chega a esta página.
* **Quando:** ele lê o conteúdo até o fim.
* **Então:** ele entende, com argumento e não apenas slogan, por que a spec é o contrato executável e o código é a consequência.

### Cenário 2: O recorte de DDD é explícito, incluindo o que fica de fora
* **Dado que:** a página explica "DDD Estritamente Conceitual".
* **Quando:** o leitor procura por menção a ORM, SQL ou migrations.
* **Então:** a página afirma explicitamente que esses itens ficam fora do escopo de modelagem do método, sem ambiguidade.

### Cenário 3: Vocabulário consistente com o glossário (INV-03)
* **Dado que:** o site foi construído com esta página publicada.
* **Quando:** `check_vocabulary.sh` é executado.
* **Então:** nenhum sinônimo proibido do subconjunto automatizado aparece nesta página.

### Cenário 4: Rastreabilidade (INV-04)
* **Dado que:** a página faz afirmações sobre o método.
* **Quando:** o leitor procura a fonte.
* **Então:** ao menos um documento de spec identificável é citado como origem da tese.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Página publicada:** `apps/site/content/en/method/paradigm.md`

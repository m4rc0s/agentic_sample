# Epic Spec: 02-pilares-e-ciclo

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar, na home, os três pilares diferenciais do Liquid frente ao ecossistema de referência (`README.md:21-25`) e uma representação fiel das sete etapas do ciclo de trabalho do método (`README.md:130-138`), usando somente os componentes de conteúdo já entregues pela feature `01` — tabela, lista ordenada, callout —, sem criar nenhum componente visual novo.
* **Bounded Context Relacionado:** **Nenhum próprio.** Consome o Bounded Context modelado no glossário da feature `03` ([`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md)). Ver justificativa completa em [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico não cunha termo novo. Usa, sem redefinir, os termos `Workspace`,
`Manifest`, `Anchor`, `Domain Enabler`, `Consequential Code` e
`Conceptually-Strict DDD`, definidos em
[`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md)
§5–§6. Os nomes dos três pilares e das sete etapas do ciclo reutilizam,
verbatim, a tradução já estabelecida por
`apps/site/content/en/method/ecosystem-positioning.md` — nenhuma segunda
tradução independente é cunhada aqui.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: Os três pilares aparecem com os nomes exatos
* **Dado que:** a home publica a seção "What's different".
* **Quando:** um leitor compara essa seção com `README.md:21-25`.
* **Então:** os três pilares — Isolamento Absoluto por Workspace, Manifesto Universal (`app_liquid.md`), Âncoras Programáticas (`index.md`) — aparecem com os mesmos nomes, na tradução já fixada por `03/ecosystem-positioning.md`, sem paráfrase divergente.

### Cenário 2: O ciclo reproduz fielmente as sete etapas
* **Dado que:** a home publica a seção "How work moves".
* **Quando:** um leitor compara essa seção com o fluxograma de `README.md:130-138`.
* **Então:** as sete etapas — Governança Raiz, Definição de Feature, Modelagem de Domínio, Validação Humana, Fila Operacional, Execução Consequencial, Auditoria Contínua — aparecem na mesma ordem, sem etapa omitida, fundida ou invertida.

### Cenário 3: Nenhum componente visual novo foi criado
* **Dado que:** as duas seções deste épico foram publicadas.
* **Quando:** o `layouts/` da aplicação é inspecionado.
* **Então:** nenhum arquivo novo foi adicionado a `layouts/_shortcodes/` ou `layouts/_partials/`; a tabela e a lista ordenada usam apenas Markdown padrão e o render hook de tabela já existente.

### Cenário 4: Vocabulário consistente com o glossário (INV-03)
* **Dado que:** o site foi construído com estas duas seções publicadas.
* **Quando:** `check_vocabulary.sh` é executado.
* **Então:** nenhum sinônimo proibido do subconjunto automatizado aparece nesta parte da home.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Seções publicadas:** "What's different" (tabela dos três pilares) e "How work moves" (lista ordenada das sete etapas) em `apps/site/content/en/_index.md`.

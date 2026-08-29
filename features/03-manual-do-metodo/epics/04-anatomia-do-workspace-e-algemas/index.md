# Epic Spec: 04-anatomia-do-workspace-e-algemas

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar o mapa de arquivos do workspace — raiz, `features/`, `epics/`, `apps/`, `assets/` — e as Algemas da IA com o porquê de cada restrição, para que um adotante entenda as fronteiras do método antes de adotar, não depois.
* **Bounded Context Relacionado:** **Nenhum próprio.** Consome o glossário. Ver [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Nenhum termo novo. Usa `Workspace`, `Feature`, `Epic`, `Spec`, `Manifest`, `Anchor` e `AI Handcuffs`, definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: O mapa de arquivos está correto
* **Dado que:** `index.md` §3 e `README.md` documentam a anatomia do repositório.
* **Quando:** a página publicada é comparada com essa anatomia.
* **Então:** todo arquivo e pasta mapeado corresponde ao que existe de fato no repositório.

### Cenário 2: Cada Algema tem o porquê explicado
* **Dado que:** `technical_agreement.md` §2 lista ações proibidas e padrões obrigatórios.
* **Quando:** a página publicada é examinada.
* **Então:** cada restrição aparece com uma explicação de propósito, não apenas a regra nua.

### Cenário 3: Vocabulário e rastreabilidade (INV-03, INV-04)
* **Dado que:** o site foi construído com esta página publicada.
* **Quando:** `check_vocabulary.sh` e `check_invariants.sh` são executados.
* **Então:** ambos passam, e a página cita `index.md`, `README.md` e `technical_agreement.md` como fonte.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Página publicada:** `apps/site/content/en/method/workspace-and-guardrails.md`

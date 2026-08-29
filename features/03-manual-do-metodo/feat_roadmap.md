# Feature Roadmap: 03-manual-do-metodo

> **Marcos e Passos Específicos para Entrega Completa da Feature**

---

## 🗺️ Ordem Sequencial de Execução dos Épicos

```text
[ Épico 01: Modelo de Conteúdo & Linguagem Ubíqua ]
        │  (dependência rígida — INV-03 exige vocabulário único)
        ▼
┌───────┴────────────┬─────────────────────┬──────────────────────────┐
▼                     ▼                     ▼                          ▼
[ Épico 02: Paradigma ] [ Épico 03: Ciclo de Vida ] [ Épico 04: Anatomia ] [ Épico 05: Posicionamento ]
```

A ordem não é inteiramente rígida entre `02`–`05`: nenhum deles depende dos outros três, todos dependem apenas de `01`. Por isso são executados **em pipeline**, um após o outro assim que o glossário existe, em vez de esperar o encadeamento sequencial completo de cada épico antes de iniciar o próximo — a ordem de execução seguida (`02` → `03` → `04` → `05`) é a ordem do relatório de plano, não uma dependência real.

* `02`, `03`, `04`, `05` dependem de `01` porque cada um consome termos do glossário canônico, e escrever conteúdo antes do glossário existir garantiria retrabalho de vocabulário (INV-03).
* `05` não depende de `02`, `03` ou `04` — o posicionamento no ecossistema é o único épico desta feature sem domínio conceitual **e** sem dependência de conteúdo interno além do glossário.

---

## 🚩 Marcos da Feature (Milestones)

### Marco 1 — O vocabulário canônico existe
* **Épicos:** [`epics/01-modelo-de-conteudo-e-linguagem-ubiqua/`](epics/01-modelo-de-conteudo-e-linguagem-ubiqua/)
* **Status:** `[Done]`
* **Critério de Conclusão:** O glossário está modelado com definição exata, sinônimos proibidos e relações para cada termo, extraído do corpus autoral; INV-03 e INV-04 estão enunciadas como regras verificáveis; a página do glossário está publicada em inglês com o termo em português citado.

### Marco 2 — A tese do paradigma está publicada
* **Épicos:** [`epics/02-paradigma-spec-como-software/`](epics/02-paradigma-spec-como-software/)
* **Status:** `[Done]`
* **Critério de Conclusão:** A página do paradigma explica a inversão spec/código e o recorte do DDD estritamente conceitual, usando os termos do glossário sem sinônimo proibido.

### Marco 3 — O ciclo de vida e os papéis estão publicados
* **Épicos:** [`epics/03-ciclo-de-vida-e-papeis/`](epics/03-ciclo-de-vida-e-papeis/)
* **Status:** `[Done]`
* **Critério de Conclusão:** A página do ciclo de vida reproduz fielmente as etapas do fluxo de trabalho do agente, os papéis humano/agente e o DoR/DoD.

### Marco 4 — A anatomia do workspace e as Algemas estão publicadas
* **Épicos:** [`epics/04-anatomia-do-workspace-e-algemas/`](epics/04-anatomia-do-workspace-e-algemas/)
* **Status:** `[Done]`
* **Critério de Conclusão:** A página mapeia corretamente os arquivos de raiz, `features/`, `epics/`, `apps/`, `assets/`, a função das âncoras `index.md`, e cada Algema da IA com o porquê da restrição.

### Marco 5 — O posicionamento no ecossistema está publicado
* **Épicos:** [`epics/05-posicionamento-no-ecossistema/`](epics/05-posicionamento-no-ecossistema/)
* **Status:** `[Done]`
* **Critério de Conclusão:** A página referencia as três iniciativas de referência com links vivos e descreve os três pilares diferenciais do Liquid sem tom de confronto.

---

## 🧭 Fronteira Desta Feature

O que vem **depois** dela e não pertence a ela: o passo a passo executável de adoção é a feature `04`; o estudo de caso da trilha de specs deste site é a feature `05`. Esta feature ensina o método; não ensina a adotá-lo nem prova que ele foi seguido.

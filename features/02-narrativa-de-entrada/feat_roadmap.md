# Feature Roadmap: 02-narrativa-de-entrada

> **Marcos e Passos Específicos para Entrega Completa da Feature**

---

## 🗺️ Ordem Sequencial de Execução dos Épicos

```text
[ Épico 01: Tese & Hero ] ──► [ Épico 02: Pilares & Ciclo ] ──► [ Épico 03: CTAs & Provas ]
```

Os três épicos escrevem, em pipeline, seções sucessivas da mesma página física
(`apps/site/content/en/_index.md`). A ordem não reflete uma dependência de
dado entre eles — nenhum lê o que o anterior escreveu — mas a ordem de
composição da página: abertura, corpo, encerramento. Todos os três dependem
apenas do glossário canônico já publicado pela feature `03`, épico `01`.

---

## 🚩 Marcos da Feature (Milestones)

### Marco 1 — A tese de abertura está publicada
* **Épicos:** [`epics/01-tese-e-hero/`](epics/01-tese-e-hero/)
* **Status:** `[Done]`
* **Critério de Conclusão:** O título e o parágrafo de abertura da home comunicam a tese central do método, com o termo `título` (front matter `title`) e o `lead` compreensíveis sem rolagem em desktop e mobile.

### Marco 2 — Os pilares e o ciclo estão publicados
* **Épicos:** [`epics/02-pilares-e-ciclo/`](epics/02-pilares-e-ciclo/)
* **Status:** `[Done]`
* **Critério de Conclusão:** A tabela dos três pilares usa os nomes exatos de `README.md:21-25`; a lista ordenada do ciclo reproduz fielmente as sete etapas de `README.md:130-138`.

### Marco 3 — As chamadas para ação e o tratamento honesto de `04`/`05` estão publicados
* **Épicos:** [`epics/03-chamadas-para-acao-e-provas/`](epics/03-chamadas-para-acao-e-provas/)
* **Status:** `[Done]`
* **Critério de Conclusão:** As duas CTAs com destino real (entender o método, ver o repositório) estão publicadas; o callout "Open decisions" documenta a omissão deliberada das CTAs para `04`/`05`, sem link quebrado.

---

## 🧭 Fronteira Desta Feature

O que vem **depois** dela e não pertence a ela: o passo a passo executável de
adoção é a feature `04`; o estudo de caso da trilha de specs deste site é a
feature `05`. Esta feature converte um visitante desconhecido em leitor do
manual; não ensina o método a fundo (isso é `03`) e não o guia na adoção
(isso será `04`).

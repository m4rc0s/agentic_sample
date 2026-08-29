# Domain Enabler (Conceptual DDD Plan): 03-ciclo-de-vida-e-papeis

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual próprio.** Publica, sem modelar entidade nova, as etapas do fluxo de trabalho do agente já definidas em [`index.md`](../../../../index.md) §4, os papéis humano/agente já definidos em [`team_playbook.md`](../../../../team_playbook.md) §1, e o Definition of Ready / Definition of Done já definidos em [`team_playbook.md`](../../../../team_playbook.md) §3–§4. O domínio conceitual real do produto está em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md); este épico consome os termos `Ubiquitous Language`, `Chief Architect / Tech Lead`, `Domain Enabler`, `Task Executor`, `Reviewer & QA`, `Definition of Ready (DoR)` e `Definition of Done (DoD)`, todos já definidos ali.

### 1.1 Justificativa

O ciclo de vida e os papéis já existem, documentados e homologados, em `index.md` e `team_playbook.md`. Publicá-los como página de conteúdo é uma tarefa de apresentação — reproduzir fielmente uma sequência e uma matriz de responsabilidades já existentes — não uma tarefa de modelagem. Não há:

1. **Transação:** a página não processa uma solicitação; descreve um processo que já ocorre no repositório.
2. **Mutação de estado:** o ciclo descrito é o mesmo em toda visita à página.
3. **Ciclo de vida de entidade:** as "etapas" do ciclo Liquid não são objetos de domínio deste site — são o assunto que o site descreve, análogo a como um manual de culinária descreve receitas sem que a página seja, ela mesma, uma entidade "Receita".
4. **Regra de negócio invariante:** a única disciplina aplicável é fidelidade ao que `index.md` e `team_playbook.md` já afirmam (INV-04) e vocabulário consistente com o glossário (INV-03), ambas herdadas do épico `01`.

### 1.2 O que seria fabricar domínio aqui, e por que não foi feito

Seria tentador modelar um "Estado do Épico" como máquina de estados formal (`Ready → WIP → Blocked → Done`), com transições e invariantes de transição. Isso pareceria DDD legítimo, mas não seria: `quick_status.md` já é esse rastro no próprio repositório, atualizado manualmente pelo agente executor como parte do rito descrito em `team_playbook.md` §2 — não há máquina de estados executável a proteger aqui, há um documento a manter atualizado. Modelar uma "invariante de transição de status" fabricaria rigor onde existe, na prática, uma convenção editorial.

---

## 2. Natureza Real do Épico: reprodução fiel de processo já homologado

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Editorial e de reprodução fiel. Nenhuma modelagem nova. |
| **Entrega** | Uma página que reproduz as etapas do fluxo de trabalho do agente, a matriz de papéis humano/agente, e o DoR/DoD, sem alterar o que esses documentos já definem. |
| **Fonte de verdade** | `index.md` §4 (etapas), `team_playbook.md` §1 (papéis), §3 (DoR), §4 (DoD) — citados, nunca reinterpretados. |
| **Dependência de vocabulário** | Consome `Ubiquitous Language`, os quatro papéis nomeados, DoR e DoD, todos definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §6. |

---

## 3. Critério de Conclusão Deste Épico

1. A página reproduz as etapas do ciclo, os papéis e o DoR/DoD sem divergir do texto de origem — verificável por conferência editorial linha a linha contra `index.md` e `team_playbook.md` (INV-04, INV-05 no sentido de autoconsistência).
2. A página está publicada, sem violar INV-01/INV-02 (herdados) nem INV-03.b (herdado do épico `01`).
3. Todo termo do glossário usado aqui usa a tradução publicada em `../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`.

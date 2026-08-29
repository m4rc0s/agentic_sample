# Domain Enabler (Conceptual DDD Plan): 04-anatomia-do-workspace-e-algemas

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual próprio.** Publica o mapa de arquivos do workspace, já definido em [`index.md`](../../../../index.md) §3 e [`README.md`](../../../../README.md) §"Anatomia do Repositório", e as Algemas da IA, já definidas por completo em [`technical_agreement.md`](../../../../technical_agreement.md) §2. O domínio conceitual real está em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md); este épico consome `Workspace`, `Feature`, `Epic`, `Spec`, `Manifest`, `Anchor` e `AI Handcuffs`, todos definidos ali.

### 1.1 Justificativa

Um mapa de arquivos e uma lista de restrições não são domínio de negócio: são **estrutura e política**, ambas já decididas e registradas em documentos existentes. Publicá-las aqui é reprodução com explicação — o "porquê" de cada Algema, não uma regra nova. Não há transação (nenhuma ação é solicitada ou recusada por esta página), não há mutação de estado, não há ciclo de vida de entidade e não há regra de negócio invariante nova — só a fidelidade ao que já está inegociavelmente decidido em `technical_agreement.md`.

### 1.2 O que seria fabricar domínio aqui, e por que não foi feito

Seria possível modelar as Algemas da IA como uma entidade `Restrição` com um ciclo de vida de aprovação/violação. Isso inverteria o papel real do documento: as Algemas não são objetos que mudam de estado dentro deste site — são texto normativo que o site **cita**, e cuja fonte de verdade permanece `technical_agreement.md`. Modelar uma "entidade Restrição" aqui duplicaria, com pior precisão, o que já existe no documento original.

---

## 2. Natureza Real do Épico: mapa e política, explicados, não redecididos

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Editorial e explicativa. Nenhuma decisão nova, nenhuma modelagem nova. |
| **Entrega** | Uma página que mapeia os arquivos de raiz, `features/`, `epics/`, `apps/`, `assets/`, explica a função das âncoras `index.md` em cada nível, e lista as Algemas da IA com o porquê de cada uma. |
| **Fonte de verdade** | `index.md` §3 (mapa de navegação), `README.md` §"Anatomia do Repositório", `technical_agreement.md` §2 (Algemas). |
| **Dependência de vocabulário** | Consome `Workspace`, `Feature`, `Epic`, `Spec`, `Manifest`, `Anchor` e `AI Handcuffs`, definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5. |

---

## 3. Critério de Conclusão Deste Épico

1. O mapa de arquivos reproduz corretamente a estrutura de `index.md` §3 e `README.md` — nenhum arquivo ou pasta inventado, nenhum omitido que já esteja documentado como âncora.
2. Cada Algema da IA de `technical_agreement.md` §2 aparece, com o porquê explicado a partir do próprio corpus (não uma justificativa nova, inventada pela página).
3. A página está publicada, sem violar INV-01/INV-02 (herdados) nem INV-03.b (herdado do épico `01`).

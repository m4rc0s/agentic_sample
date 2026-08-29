# Domain Enabler (Conceptual DDD Plan): 05-posicionamento-no-ecossistema

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual próprio.** Publica o posicionamento do Liquid frente ao ecossistema de referência — GitHub Spec-Kit, OpenSpec/SpecDD e The SDD Standard —, já registrado em [`index.md`](../../../../index.md) §2 e [`README.md`](../../../../README.md) §"Referências Globais". Diferente dos épicos `02`–`04`, este nem consome o glossário de forma intensa: os três pilares diferenciais do Liquid (Isolamento Absoluto por Workspace, Manifesto Universal, Âncoras Programáticas) já foram nomeados e definidos no épico `01`, e este épico apenas os situa contra as iniciativas externas.

### 1.1 Justificativa

Situar o método frente a outras iniciativas é um ato editorial de posicionamento, não de modelagem de domínio. Não há entidade, evento ou invariante de negócio em comparar três projetos externos com os três pilares do Liquid — há apresentação factual do que cada um faz e do que o Liquid acrescenta. As quatro condições que definiriam domínio conceitual (transação, mutação de estado, ciclo de vida de entidade, regra de negócio invariante) estão ausentes pela mesma razão já registrada nos demais épicos sem domínio desta feature e da feature `01`.

---

## 2. Natureza Real do Épico: posicionamento factual, não confronto

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Editorial e factual. Nenhuma modelagem, nenhuma crítica nomeada a ferramenta de terceiros. |
| **Entrega** | Uma página que descreve GitHub Spec-Kit, OpenSpec/SpecDD e The SDD Standard, com links vivos, e situa os três pilares diferenciais do Liquid contra eles — o que o método partilha e o que acrescenta. |
| **Fonte de verdade** | `index.md` §2 ("O Ecossistema de Referência Global e a Nossa Variação") e `README.md` §"Referências Globais". |
| **Dependência de vocabulário** | Consome `Workspace`, `Manifest` e `Anchor`, definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5, como os três pilares que a página compara. |

---

## 3. Critério de Conclusão Deste Épico

1. As três iniciativas de referência aparecem descritas com precisão, sem distorção, e com link vivo para cada uma.
2. Os três pilares diferenciais do Liquid aparecem nomeados exatamente como em `index.md` §2, sem confronto a ferramenta nomeada.
3. A página está publicada, sem violar INV-01/INV-02 (herdados) nem INV-03.b (herdado do épico `01`).

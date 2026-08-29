# Domain Enabler (Conceptual DDD Plan): 01-tese-e-hero

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual próprio. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Esta é uma declaração deliberada e justificada, amparada pelo
[`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo
[`technical_agreement.md`](../../../../technical_agreement.md) §4.1, no mesmo
padrão já adotado pelos épicos sem domínio das features `01` e `03`. O
domínio conceitual real deste produto está inteiramente modelado em
[`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md);
este épico **consome** esse glossário — não modela um domínio próprio.

### 1.1 Justificativa

Este épico publica o título e o parágrafo de abertura de uma página estática:
a tese de que a IA automatizou a escrita de sintaxe, não a arquitetura de
software. Não há:

1. **Transação.** Anunciar uma tese não é uma operação que possa ser aceita ou recusada segundo uma regra de negócio.
2. **Mutação de estado.** O conteúdo é texto fixo, compilado uma única vez pelo Hugo.
3. **Ciclo de vida de entidade.** Não há objeto de domínio nascendo, mudando ou sendo encerrado — há uma frase de abertura sendo apresentada.
4. **Regra de negócio invariante.** A única disciplina que se aplica a este conteúdo é vocabular (INV-03) e de autoconsistência com o que o manual já publicou (INV-05), ambas herdadas — a primeira do épico `01` da feature `03`, a segunda do relatório de plano §2.1.

### 1.2 O que seria fabricar domínio aqui, e por que não foi feito

Seria possível inventar uma entidade `Hero` com atributos `título` e
`subtítulo`, ou um evento `HeroExibido`. Nenhuma das duas resiste ao exame:
`Hero` não tem identidade que persista através de mudança de estado — é uma
seção de texto compilada, no mesmo padrão já examinado nos épicos sem
domínio da feature `01`
([`../../../01-fundacao-publicacao/epics/01-manifesto-e-scaffold-do-app/plan.md`](../../../01-fundacao-publicacao/epics/01-manifesto-e-scaffold-do-app/plan.md)
§1.2, sobre `PáginaRenderizada`). `HeroExibido` não teria consumidor, pela
mesma razão.

---

## 2. Natureza Real do Épico: conteúdo editorial que consome o glossário

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Editorial. Anuncia, na primeira dobra da home, uma tese já modelada em profundidade pela feature `03`, sem modelar domínio novo. |
| **Entrega** | O título e o parágrafo de abertura de `apps/site/content/en/_index.md`: a inversão spec/código, compreensível sem rolagem. |
| **Fonte de verdade** | `index.md` §1 e `README.md`, seção "O Que é...", ambos já parafraseados por `03/paradigm.md` — a home reaproveita a mesma frase de abertura já cunhada ali, sem reformulá-la. |
| **Dependência de vocabulário** | Consome os termos `Spec` e `Consequential Code`, definidos em [`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5. Nenhum termo novo é cunhado aqui. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a
declaração de ausência de domínio não dispensa verificação. Este épico não
enuncia invariante própria — herda INV-01, INV-02 (feature `01`) e INV-03.b
(feature `03`, épico `01`) — e seu critério de conclusão é:

1. O título e o `lead` da home comunicam a tese completa sem exigir rolagem, verificado visualmente em desktop e mobile.
2. A página está publicada, construída pelo Hugo, sem violar INV-01/INV-02 nem INV-03.b.
3. Nenhuma afirmação desta seção contradiz o que `03/paradigm.md` já publicou (INV-05, verificação editorial — não há checker automatizado para autoconsistência semântica, pelo mesmo motivo já documentado em `scripts/check_vocabulary.sh`: julgar se duas passagens dizem a mesma coisa é decisão semântica, não estrutural).

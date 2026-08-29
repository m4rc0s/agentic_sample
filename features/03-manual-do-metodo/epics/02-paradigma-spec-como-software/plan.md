# Domain Enabler (Conceptual DDD Plan): 02-paradigma-spec-como-software

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual próprio. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Esta é uma declaração deliberada e justificada, amparada pelo [`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo [`technical_agreement.md`](../../../../technical_agreement.md) §4.1, no mesmo padrão já adotado pelos épicos `01` e `02` de [`01-fundacao-publicacao`](../../../01-fundacao-publicacao/index.md). O domínio conceitual real deste produto está inteiramente modelado em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md); este épico **consome** esse glossário — não modela um domínio próprio.

### 1.1 Justificativa

Este épico publica uma página editorial: a tese aprofundada de que a spec é o software e o código é consequência, e o recorte que o método faz do DDD ("DDD Estritamente Conceitual"). Não há:

1. **Transação.** Explicar uma tese não é uma operação que possa ser aceita ou recusada segundo uma regra de negócio.
2. **Mutação de estado.** O conteúdo é texto fixo, compilado uma única vez.
3. **Ciclo de vida de entidade.** Não há objeto de domínio nascendo, mudando ou sendo encerrado — há um argumento sendo apresentado.
4. **Regra de negócio invariante.** Não existe verdade de negócio a proteger aqui; a única disciplina que se aplica a este conteúdo é vocabular (INV-03) e de rastreabilidade (INV-04), ambas já modeladas no épico `01` e herdadas, não reenunciadas.

### 1.2 O que seria fabricar domínio aqui, e por que não foi feito

Seria possível inventar uma entidade `Tese` com atributos `título` e `argumento`, ou um evento `TesePublicada`. Nenhuma das duas resiste ao exame: `Tese` não tem identidade que persista através de mudança de estado — é um texto compilado, igual a toda página de apresentação já examinada nos épicos sem domínio da feature `01`. `TesePublicada` não teria consumidor, pela mesma razão já registrada em [`01-fundacao-publicacao/epics/01-manifesto-e-scaffold-do-app/plan.md`](../../../01-fundacao-publicacao/epics/01-manifesto-e-scaffold-do-app/plan.md) §1.2 para `PáginaRenderizada`.

---

## 2. Natureza Real do Épico: conteúdo editorial que consome o glossário

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Editorial. Aprofunda uma tese já anunciada nos documentos de governança, sem modelar domínio novo. |
| **Entrega** | Uma página publicada que explica por que a spec é o software, o que significa "DDD Estritamente Conceitual" neste método, e o que fica explicitamente fora do DDD aqui (ORM, SQL, migrations). |
| **Fonte de verdade** | `index.md` §1 e §2, `README.md` §"O Que é...", ambos já citados e parafraseados, nunca reinventados. |
| **Dependência de vocabulário** | Consome os termos `Spec`, `Consequential Code`, `Conceptually-Strict DDD`, `Domain Invariant`, `Domain Event`, `Bounded Context` e `Ubiquitous Language`, todos definidos em [`../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5–§6. Nenhum termo novo é cunhado aqui. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a declaração de ausência de domínio não dispensa verificação. Este épico não enuncia invariante própria — herda INV-03 e INV-04 do épico `01` — e seu critério de conclusão é:

1. A página está publicada, construída pelo Hugo, sem violar INV-01/INV-02 (herdados da feature `01`) nem INV-03.b (herdado do épico `01` desta feature, verificado pelo mesmo `check_vocabulary.sh`).
2. Todo termo do glossário usado nesta página usa a tradução publicada em `../01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`, sem sinônimo proibido.
3. A página cita ao menos um documento de spec identificável como fonte da tese que apresenta (INV-04.a).

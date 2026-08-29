# Domain Enabler (Conceptual DDD Plan): 01-quickstart-do-zero-ao-primeiro-epico

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Esta é uma declaração deliberada e justificada, amparada pelo [`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo [`technical_agreement.md`](../../../../technical_agreement.md) §4.1, no mesmo padrão já adotado pelos épicos `01`/`02` de [`01-fundacao-publicacao`](../../../01-fundacao-publicacao/index.md) e pelos épicos `02`–`05` de [`03-manual-do-metodo`](../../../03-manual-do-metodo/index.md). As seções de Entidades, Eventos e Casos de Uso do molde foram **removidas em vez de preenchidas**: preenchê-las aqui produziria ficção.

### 1.1 Justificativa

Este épico publica uma única página editorial e sequencial: o caminho feliz de adoção. Não há:

1. **Transação.** Seguir um guia não é uma operação que o sistema aceita ou recusa segundo uma regra de negócio.
2. **Mutação de estado.** O conteúdo é texto fixo, compilado uma única vez pelo Hugo.
3. **Ciclo de vida de entidade.** Não há objeto de domínio nascendo, mudando ou sendo encerrado — há uma sequência de instruções sendo apresentada.
4. **Regra de negócio invariante.** Não existe verdade de negócio a proteger; a única disciplina que se aplica a este conteúdo é vocabular (INV-03, herdada do glossário de `03/01`) e de rastreabilidade (INV-04, herdada do mesmo lugar).

### 1.2 O que seria fabricar domínio aqui, e por que não foi feito

Seria possível inventar uma entidade `Jornada` com estados `iniciada`, `em_andamento`, `concluída`, e um evento `PrimeiroPlanoAprovado`. Nenhuma resiste ao exame: `Jornada` não tem identidade que persista através de mutação de estado — é uma sequência de parágrafos fixa, igual a toda página de apresentação já examinada nos épicos sem domínio das features `01` e `03`. `PrimeiroPlanoAprovado` não teria consumidor em tempo de execução — a aprovação real de um `plan.md`, quando o adotante a executa fora deste site, acontece no workspace dele, não neste produto, e este produto não observa nem reage a ela.

---

## 2. Natureza Real do Épico: apresentação sequencial verificada

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Apresentação. Nenhuma lógica de negócio, nenhum estado, nenhuma transação. |
| **Entrega** | Uma página publicada com os quatro passos do caminho feliz, cada comando citado conferido contra o repositório real, e uma nota verificada sobre agentes suportados. |
| **Fonte de verdade** | `README.md` §"Como Usar Este Template" (os quatro passos), `.agents/hermes_bootstrap.md` (ativação do agente), `.agents/prompts_guide.md` Etapas 1–3 (preenchimento do contexto, definição da feature, modelagem do `plan.md`), `AGENTS.md` e `CLAUDE.md` como existem hoje em `main` (a nota sobre agentes). |
| **Dependência de vocabulário** | Consome `Workspace`, `Spec`, `Feature`, `Épico`, `Domain Enabler`, todos definidos em [`03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5. Nenhum termo novo é cunhado aqui. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a declaração de ausência de domínio não dispensa verificação. Este épico não enuncia invariante própria — herda INV-01, INV-02 (feature `01`) e INV-03, INV-04 (feature `03`/épico `01`) — e seu critério de conclusão é:

1. A página está publicada, construída pelo Hugo, sem violar INV-01/INV-02 nem INV-03.b.
2. Cada comando de shell citado na página corresponde, palavra por palavra, a um comando real de `README.md` ou a uma execução de fato realizada por este épico — nenhum comando é aproximado de memória.
3. A nota sobre agentes suportados foi escrita depois de ler `AGENTS.md` e `CLAUDE.md` como existem em `main` nesta entrega, não copiada de `README.md` §1 sem checar.
4. A página cita ao menos um documento de spec identificável como fonte de cada passo do caminho feliz (INV-04.a).

# Domain Enabler (Conceptual DDD Plan): 03-chamadas-para-acao-e-provas

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

Este épico publica duas chamadas para ação com destino real e um callout
explicando a omissão deliberada de duas outras. Não há:

1. **Transação.** Um clique em um link não é uma operação de negócio que este produto aceita ou recusa — é navegação.
2. **Mutação de estado.** Nenhuma CTA aqui registra intenção do visitante, coleta dado ou muda estado no servidor (não há servidor). Comparar com `technical_agreement.md` §4.1: "Comentários, cadastro, formulários e qualquer capacidade que exija processamento no servidor" estão fora do escopo de toda a feature `01`, herdado aqui.
3. **Ciclo de vida de entidade.** Não há uma entidade "Chamada para Ação" com estados (`pendente`, `clicada`, `convertida`) — seria fabricar analytics que este produto explicitamente não tem (feature `01`, fora de escopo: "Métricas de audiência, telemetria e qualquer coleta de dados do visitante").
4. **Regra de negócio invariante.** A única disciplina real aqui é de integridade referencial (INV-02, herdada da feature `01`) — que toda CTA publicada aponte para algo que existe.

### 1.2 A decisão sobre `04` e `05` não é modelagem de domínio — é escopo, e já foi tomada

O relatório de plano original (§3, Feature 02) descrevia três CTAs
hierarquizadas: entender o método (`03`), começar agora (`04`), ver o
repositório; mais um "selo de prova viva" apontando para a feature `05`.
Neste momento do produto, `04` e `05` não existem. A tentação de modelagem
seria criar uma entidade `Feature Futura` com um estado `planejada` versus
`publicada` — isso fabricaria domínio para resolver o que é, na verdade, uma
decisão de escopo do capitão, já registrada em
[`../../index.md`](../../index.md) §6.1: **omitir** as duas CTAs sem
destino real, com uma nota honesta, em vez de apontá-las provisoriamente
para dentro do manual (`03`) ou fabricar um placeholder para `04`/`05`. Este
`plan.md` não reabre essa decisão; ele apenas confirma que executá-la não
exige nenhuma modelagem de domínio — é uma escolha editorial de o que
**não** publicar, seguida de uma verificação estrutural (INV-02) de que a
omissão foi completa.

---

## 2. Natureza Real do Épico: conteúdo editorial que consome o glossário

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Editorial e de integridade referencial. Publica dois links reais e documenta, sem fabricar destino, dois links que o plano original previa e que não podem existir ainda. |
| **Entrega** | A seção "Where to go next" (duas CTAs) e o callout "Open decisions" em `apps/site/content/en/_index.md`. |
| **Fonte de verdade** | Relatório de plano §3 (Feature 02, lista de CTAs originalmente prevista) e a decisão do capitão registrada em [`../../index.md`](../../index.md) §6.1. |
| **Dependência de vocabulário** | Consome o termo `Spec`, definido em [`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5. Nenhum termo novo é cunhado aqui. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a
declaração de ausência de domínio não dispensa verificação. Este épico não
enuncia invariante própria — herda INV-01, INV-02 (feature `01`) e INV-03.b
(feature `03`, épico `01`) — e seu critério de conclusão é, especificamente
para este épico, o mais rígido de checar automaticamente:

1. `check_invariants.sh` (INV-02) passa sobre a home publicada, com zero referências internas quebradas.
2. Uma busca textual pela home publicada não encontra nenhuma menção a caminho de arquivo ou rota das features `04` ou `05` — a omissão é estrutural, não apenas visual.
3. O callout "Open decisions" está presente e nomeia explicitamente as duas CTAs omitidas e a razão da omissão.
4. As duas CTAs publicadas ("Understand the method", "See the repository") resolvem para destinos reais, confirmado por INV-02.a.

# Domain Enabler (Conceptual DDD Plan): 03-referencia-de-scaffold-e-checklists

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Esta é uma declaração deliberada e justificada, amparada pelo [`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo [`technical_agreement.md`](../../../../technical_agreement.md) §4.1, no mesmo padrão já adotado pelos dois épicos irmãos desta feature. As seções de Entidades, Eventos e Casos de Uso do molde foram **removidas em vez de preenchidas**.

### 1.1 Justificativa

Este épico publica a saída verificada de um script existente e dois checklists já homologados. Não há:

1. **Transação.** Executar um comando de scaffold uma vez, fora deste produto, para documentar sua saída não é uma operação que este site aceita ou recusa.
2. **Mutação de estado.** A execução que produziu a saída documentada aconteceu numa cópia descartável fora do repositório (ver §1.2); o que este site publica é texto fixo, o resultado dela.
3. **Ciclo de vida de entidade.** Não há objeto de domínio deste site nascendo, mudando ou sendo encerrado.
4. **Regra de negócio invariante.** Não existe verdade de negócio a proteger aqui; a disciplina real é de **fidelidade de captura** — a saída publicada é a saída real, não uma reconstrução de memória — tratada como critério de conclusão em §3, não como invariante de negócio.

### 1.2 Onde os comandos foram executados, e por quê

Os três comandos de `scripts/scaffold.sh` foram executados numa cópia do repositório no scratchpad, **fora** desta árvore de trabalho — o mesmo procedimento já registrado pelo relatório de plano de features (§6.3) e pela feature `01` para o Hugo. Rodar `./scripts/scaffold.sh feature`, `epic` e `app` dentro deste próprio repositório de trabalho criaria features e aplicações fictícias que teriam de ser removidas depois, um resíduo desnecessário. A saída documentada nesta página é, portanto, uma **transcrição fiel de uma execução real**, não uma simulação e não uma reconstrução de memória.

---

## 2. Natureza Real do Épico: referência verificada de comando e checklist

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Referência editorial. Nenhuma lógica de negócio, nenhum estado, nenhuma execução em tempo de visita. |
| **Entrega** | Uma página publicada com os três comandos de `scaffold.sh`, a saída real de cada execução, a árvore de arquivos gerada, e os checklists de DoR e DoD. |
| **Fonte de verdade** | `scripts/scaffold.sh` (comportamento real, executado), `team_playbook.md` §3 (DoR) e §4 (DoD). |
| **Dependência de vocabulário** | Consome `Feature`, `Épico`, `Manifesto`, `Definition of Ready (DoR)`, `Definition of Done (DoD)`, todos definidos em [`03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5–§6. Nenhum termo novo é cunhado aqui. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a declaração de ausência de domínio não dispensa verificação. Este épico não enuncia invariante nova — herda INV-01, INV-02 (feature `01`) e INV-03, INV-04 (feature `03`/épico `01`) — e adiciona um único critério próprio, de fidelidade de captura:

1. A página está publicada, construída pelo Hugo, sem violar INV-01/INV-02 nem INV-03.b.
2. **Os três comandos foram de fato executados** numa cópia fora deste repositório antes da publicação, e a saída de console e a árvore de arquivos publicadas correspondem exatamente ao que essa execução produziu.
3. Os checklists de DoR e DoD reproduzem `team_playbook.md` §3–4 sem alterar o critério original.
4. A página cita `scripts/scaffold.sh` e `team_playbook.md` como fontes (INV-04.a).

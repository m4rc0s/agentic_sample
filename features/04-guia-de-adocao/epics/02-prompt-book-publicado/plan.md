# Domain Enabler (Conceptual DDD Plan): 02-prompt-book-publicado

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual próprio. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Esta é uma declaração deliberada e justificada, amparada pelo [`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo [`technical_agreement.md`](../../../../technical_agreement.md) §4.1, no mesmo padrão já adotado pelo épico irmão [`01`](../01-quickstart-do-zero-ao-primeiro-epico/plan.md) e pelos épicos consumidores da feature `03`. O domínio conceitual real deste produto está inteiramente modelado em [`03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md); este épico **consome** esse glossário e reproduz fielmente um artefato já existente — não modela nada novo.

### 1.1 Justificativa

Este épico publica uma reprodução literal de seis prompts já escritos. Não há:

1. **Transação.** Reproduzir um texto não é uma operação sujeita a regra de negócio.
2. **Mutação de estado.** O conteúdo é cópia fiel de um arquivo versionado, compilada uma única vez.
3. **Ciclo de vida de entidade.** Um prompt publicado não nasce, não muda de estado e não é encerrado neste site — ele é citado.
4. **Regra de negócio invariante.** A única disciplina real aqui não é de domínio, é de **fidelidade de reprodução** — tratada em §2, não como invariante de negócio, mas como o critério de conclusão deste épico.

### 1.2 A tensão de idioma nesta página, e por que não é resolvida aqui

Os seis prompts de `.agents/prompts_guide.md` estão em português — o mesmo corpus de spec do produto inteiro. O site nasce em inglês (decisão fechada, [`01-fundacao-publicacao/index.md`](../../../01-fundacao-publicacao/index.md) §6.1). Este épico **não traduz o corpo dos prompts**: o critério de aceitação do plano aprovado (INV-05, a prova viva) exige que os prompts publicados sejam **idênticos** ao original — traduzir o corpo do prompt violaria essa exigência diretamente, e um prompt "quase idêntico, mas em inglês" não é mais identidade, é paráfrase. A página publica o texto de apresentação de cada etapa em inglês (título, objetivo, contexto) e o **corpo do prompt em português, verbatim**, no mesmo padrão editorial já adotado pela página do glossário para os termos originais. Esta tensão é herdada da mesma decisão em aberto registrada em `01-fundacao-publicacao/index.md` §6.1 e `03-manual-do-metodo/index.md` §6.1; este épico não a resolve nem a duplica.

---

## 2. Natureza Real do Épico: reprodução literal verificada

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Reprodução editorial fiel de um artefato existente. Nenhuma lógica de negócio, nenhum estado. |
| **Entrega** | Uma página publicada com os seis prompts de `.agents/prompts_guide.md`, em blocos de código copiáveis, com o corpo de cada prompt idêntico ao original. |
| **Fonte de verdade** | `.agents/prompts_guide.md`, citado e nunca reescrito. |
| **Dependência de vocabulário** | O texto de apresentação (não os prompts, que são citação) usa `Feature`, `Épico`, `Domain Enabler`, `plan.md`, `tasks.md`, `Workspace`, todos definidos em [`03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a declaração de ausência de domínio não dispensa verificação. Este épico não enuncia invariante nova — herda INV-01, INV-02 (feature `01`) e INV-03, INV-04 (feature `03`/épico `01`) — e adiciona um único critério próprio, de fidelidade de reprodução:

1. A página está publicada, construída pelo Hugo, sem violar INV-01/INV-02 nem INV-03.b.
2. **Os seis prompts publicados são idênticos, caractere por caractere no corpo do prompt, aos seis prompts de `.agents/prompts_guide.md`** — verificado por comparação direta, não por leitura aproximada, antes do fechamento do épico (`tasks.md`, tarefa de conferência).
3. O texto de apresentação em torno dos prompts usa apenas termos do glossário publicado, sem sinônimo proibido.
4. A página cita `.agents/prompts_guide.md` como fonte (INV-04.a).

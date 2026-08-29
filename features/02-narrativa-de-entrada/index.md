# Feature Spec: 02-narrativa-de-entrada

> **Visão Geral e Escopo de Negócio da Funcionalidade**

---

## 1. Proposta de Valor e Problema do Usuário

* **O Problema:** A feature `01` tornou possível publicar qualquer página, mas a home publicada hoje é uma página de exemplo explicitamente provisória, sem nenhum conteúdo do método. Um visitante que nunca ouviu falar do Liquid e chega por um link em rede social, newsletter ou agregador não tem, em lugar nenhum do site, uma resposta rápida a duas perguntas: qual problema este método resolve, e por que ele é diferente de simplesmente "usar um agente de IA para programar". Sem essa resposta na primeira dobra, esse visitante fecha a aba antes de chegar ao manual que a feature `03` já publicou.
* **O Valor Entregue:** Passa a existir uma home page real: a tese de abertura do método ("a IA não resolveu a arquitetura de software, ela automatizou a escrita de sintaxe"), os três pilares diferenciais do Liquid frente ao ecossistema, e uma representação fiel do ciclo de trabalho do método — tudo isso compreensível sem rolagem na primeira dobra, com caminhos claros de aprofundamento para quem quer ir além.
* **Persona Impactada:** Tech Lead / arquiteto / desenvolvedor que já usa agentes de IA e sente a dor de código gerado sem governança. Chega por link externo, sem contexto prévio do repositório.

**Natureza da feature:** conversão. Diferente da feature `01` (habilitadora) e da feature `03` (conteúdo núcleo), esta feature não ensina o método em profundidade — ela decide, em menos de um minuto de leitura, se o visitante continua. **Domínio conceitual: nenhum em nenhum dos três épicos.** Esta feature inteira consome o glossário canônico já publicado pela feature `03`, épico `01`, sem cunhar termo novo — ver justificativa em cada `plan.md` de épico.

---

## 2. Escopo Funcional e Limites (In / Out of Scope)

### ✅ No Escopo:
- A home page (`apps/site/content/en/_index.md`), reescrita por completo, substituindo o conteúdo de exemplo provisório da feature `01`.
- A tese de abertura do método: a IA automatizou a escrita de sintaxe, não a arquitetura; a especificação é o software, o código é consequência.
- Os três pilares do Liquid, apresentados de forma escaneável, com os nomes exatos de `README.md:21-25`, traduzidos com a mesma fidelidade já estabelecida pela feature `03` (`ecosystem-positioning.md`).
- Uma representação fiel das sete etapas do ciclo de `README.md:130-138` (Governança Raiz → Definição de Feature → Modelagem de Domínio → Validação Humana → Fila Operacional → Execução Consequencial → Auditoria Contínua), expressa apenas com os componentes de conteúdo já entregues pela feature `01` (tabela, lista ordenada, callout) — nenhum componente visual novo.
- Chamadas para ação hierarquizadas: entender o método (aponta para a feature `03`) e ver o repositório. A CTA "começar agora" (feature `04`) e o selo de "prova viva" (feature `05`) são tratados honestamente — ver §6.
- Todo termo usado é o termo canônico do glossário publicado pela feature `03`, sem sinônimo proibido (INV-03).

### ❌ Fora do Escopo (Fronteiras Explícitas):
- Explicação aprofundada de qualquer conceito do método — a home aponta, o manual (`03`) explica.
- Instruções de instalação ou comandos de adoção — pertencem à feature `04`, que ainda não existe.
- Comparativo detalhado com Spec-Kit/OpenSpec/SDD Standard — já publicado por `03`, épico `05`; a home apenas referencia essa página, não a duplica.
- Depoimentos, logos de adotantes, números de uso, qualquer elemento comercial ou de precificação — não existem e não serão fabricados (o método é MIT).
- Qualquer identidade visual, logo, paleta nova ou componente de UI novo — usa estritamente o sistema visual já entregue pela feature `01`.
- Hospedagem, domínio próprio e deploy — decisões do capitão adiadas, como nas features `01` e `03`.
- Construção das features `04` (guia de adoção) e `05` (prova viva) — não existem neste repositório e não são criadas aqui, nem como placeholder.

---

## 3. Histórias de Usuário Chave (User Stories)

* **US-01:** Como **visitante que nunca ouviu falar do Liquid**, eu quero entender a tese central do método sem precisar rolar a página para que **eu decida em segundos se vale a pena continuar lendo**.
* **US-02:** Como **visitante avaliando o método**, eu quero ver os três pilares que diferenciam o Liquid do ecossistema mais amplo para que **eu saiba o que é específico deste método, e não apenas uma reafirmação genérica de "spec-first"**.
* **US-03:** Como **visitante avaliando o método**, eu quero ver como o trabalho se move do zero até o código para que **eu entenda onde o humano decide e onde o agente atua sozinho, antes de investir tempo lendo o manual inteiro**.
* **US-04:** Como **visitante convencido pela tese**, eu quero um caminho claro de aprofundamento para que **eu não precise adivinhar para onde ir em seguida**.
* **US-05:** Como **mantenedor do método**, eu quero que a home nunca afirme a existência de uma feature que não foi construída para que **o site não viole a integridade referencial que a própria feature `01` passou a verificar automaticamente (INV-02)**.

---

## 4. Decomposição em Épicos de Domínio (`epics/`)

Esta feature é subdividida nos seguintes pacotes atômicos de valor, executados em pipeline sobre a mesma página física (`apps/site/content/en/_index.md`):

1. **[`epics/01-tese-e-hero/`](epics/01-tese-e-hero/index.md):** A proposição de abertura e a primeira dobra. *Domínio conceitual: nenhum. Consome o glossário publicado pela feature `03`.*
2. **[`epics/02-pilares-e-ciclo/`](epics/02-pilares-e-ciclo/index.md):** Os três pilares do Liquid e a representação do ciclo de trabalho de sete etapas. *Domínio conceitual: nenhum.*
3. **[`epics/03-chamadas-para-acao-e-provas/`](epics/03-chamadas-para-acao-e-provas/index.md):** As chamadas para ação hierarquizadas e o tratamento honesto das features `04`/`05`, que ainda não existem. *Domínio conceitual: nenhum.*

---

## 5. Critérios de Aceitação Gerais da Feature

- [x] Critério 1: Os três épicos existem em `features/02-narrativa-de-entrada/` com `index.md`, `plan.md`, `tasks.md`, `quick_status.md` e `epic_roadmap.md` preenchidos, sem placeholder residual.
- [x] Critério 2: A tese central é compreensível sem rolagem, em desktop e mobile.
- [x] Critério 3: Os três pilares aparecem com os nomes exatos usados em `README.md:21-25` (traduzidos com a mesma fidelidade da feature `03`).
- [x] Critério 4: O ciclo reproduz fielmente as sete etapas de `README.md:130-138`.
- [x] Critério 5: Todo termo usado é o termo canônico do glossário (INV-03) — nenhum sinônimo proibido.
- [x] Critério 6: Nenhuma referência quebrada às features `04`/`05` (INV-02) — a decisão sobre como tratar esses CTAs está registrada em §6 abaixo.
- [x] Critério 7: O checker de INV-01/INV-02 continua passando com a home publicada.
- [x] Critério 8: O checker de INV-03.b (vocabulário) continua passando com a home publicada.

---

## 6. Decisões do Capitão — Estado

### 6.1 ✅ FECHADA — Tratamento das CTAs para as features `04` e `05`

**Contexto:** o relatório de plano (§3, Feature 02) previa CTAs hierarquizadas apontando para a feature `04` ("começar agora") e um selo de "prova viva" apontando para a feature `05`. Nenhuma das duas existe neste repositório. Publicar um link para elas violaria INV-02 (integridade referencial); publicar uma página vazia para cada uma seria uma referência enganosa, proibida pelo briefing desta tarefa.

**Opções levantadas:** (a) omitir essas CTAs específicas por completo, com esta nota registrando a decisão; (b) apontar provisoriamente para uma âncora dentro do manual (`03`) como destino substituto.

**Decisão do capitão:** opção (a). A home publica apenas as duas CTAs para as quais existe destino real hoje — **entender o método** (aponta para a feature `03`) e **ver o repositório** (link externo, já presente também no rodapé global). Nenhum apontamento provisório para dentro do manual finge ser o que essas duas CTAs prometeriam.

**Efeito sobre a entrega:** a home traz um callout "Open decisions" explicando, para o visitante e para qualquer agente que audite o site depois, que essas duas chamadas para ação foram deliberadamente omitidas até que as features `04` e `05` existam — não esquecidas, não adiadas em silêncio.

### 6.2 ✅ HERDADA, FECHADA — Idioma, stack, onde o site vive, DoD sem domínio de negócio

Idênticas às decisões já registradas em [`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md) §6.3–§6.6 e confirmadas por [`../03-manual-do-metodo/index.md`](../03-manual-do-metodo/index.md) §6.2. Esta feature não reabre nenhuma delas: o site nasce em inglês, vive em `apps/site/`, usa Hugo, e o DoD aceita invariantes de artefato verificadas por checker no lugar de invariantes de domínio inexistentes.

### 6.3 🟡 HERDADA, EM ABERTO — Tensão de idioma no corpus de spec

Idêntica à decisão registrada em [`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md) §6.1. Esta feature não a resolve: os documentos desta pasta (`features/02-narrativa-de-entrada/`) estão em português, coerentes com o corpus; o conteúdo publicado em `apps/site/content/en/` está em inglês.

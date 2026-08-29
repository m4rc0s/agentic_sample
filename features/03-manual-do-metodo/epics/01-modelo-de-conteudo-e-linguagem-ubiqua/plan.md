# Domain Enabler (Conceptual DDD Plan): 01-modelo-de-conteudo-e-linguagem-ubiqua

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 0. Enquadramento: por que este épico tem domínio conceitual real

Ao contrário de todos os outros épicos desta feature — e da maioria dos épicos da feature `01` —, este **tem** domínio conceitual genuíno, e ele não é o domínio de um site. É o domínio do **próprio método Liquid**, que este produto publica. Os conceitos abaixo — *Workspace*, *Feature*, *Épico*, *Spec*, *Manifesto*, *Âncora*, *Algemas da IA*, *Domain Enabler*, *Código Consequencial* — têm definição exata, sinônimos proibidos e relações entre si em todo o corpus autoral do repositório ([`index.md`](../../../../index.md), [`README.md`](../../../../README.md), [`team_playbook.md`](../../../../team_playbook.md), [`technical_agreement.md`](../../../../technical_agreement.md), [`features/README.md`](../../../../features/README.md), [`apps/README.md`](../../../../apps/README.md), [`.agents/hermes_bootstrap.md`](../../../../.agents/hermes_bootstrap.md), [`.agents/prompts_guide.md`](../../../../.agents/prompts_guide.md)). Isso é **Linguagem Ubíqua** no sentido estrito do DDD: os termos exatos que negócio e agentes de IA devem usar em conjunto ([`index.md`](../../../../index.md) §1).

Nenhuma definição abaixo foi inventada. Cada uma cita a fonte exata de onde foi extraída. Onde o corpus usa o termo em inglês (`Workspace`, `Feature`, `Domain Enabler`) — porque o próprio vocabulário autoral já é bilíngue nesses pontos —, a tradução é trivial. Onde o corpus cunhou vocabulário autoral em português ("Algemas da IA", "Código Consequencial"), a tradução para o inglês do site é uma decisão terminológica deste épico, justificada termo a termo em §2.

---

## 1. Entidades de Domínio e Value Objects (Conceitual)

**Nenhuma entidade transacional.** Os termos do glossário não são entidades no sentido de DDD tradicional — não têm ciclo de vida, não mudam de estado, não são criados nem destruídos em tempo de execução. São **conceitos de Linguagem Ubíqua**: definições fixas que o negócio e os agentes compartilham.

Existe, porém, um **value object legítimo**, que é o motivo estrutural deste épico existir:

### Value Object: `TermoDoGlossário`
* **Descrição:** Objeto imutável e sem identidade própria, definido inteiramente pelo seu conjunto de atributos. Dois termos com os mesmos atributos seriam o mesmo termo — é essa propriedade que torna INV-03 (vocabulário único) verificável.
* **Atributos:**
  - `termo_original` — o termo tal como aparece no corpus de governança em português.
  - `termo_publicado` — a tradução para o inglês, usada em todo texto publicado no site.
  - `definição` — o enunciado exato do conceito, extraído do corpus, não inventado.
  - `sinônimos_proibidos` — o conjunto de palavras e expressões, em português e em inglês, que **não** podem ser usadas para nomear este conceito em conteúdo publicado.
  - `relações` — os outros termos do glossário aos quais este termo se conecta, e a natureza da conexão.
  - `fonte` — o documento e, quando aplicável, a seção ou linha de onde a definição foi extraída.
* **Por que é value object e não entidade:** não tem ciclo de vida. Se a definição de um termo muda, não é o mesmo termo que "evoluiu" — é uma nova versão do glossário. A identidade do termo está inteiramente no seu valor, não em um identificador separado.

---

## 2. Regras de Negócio Invariantes (Regras Inegociáveis)

Este produto não tem invariante de **negócio** transacional. Tem duas invariantes de **publicação de vocabulário e rastreabilidade**, que este épico é o primeiro a enunciar e que os épicos `02`–`06`/ep.3 (segundo o relatório de plano, §4.1) dependem dele para poder cumprir. Ambas seguem a regra geral do [`team_playbook.md`](../../../../team_playbook.md) §4.1 e o catálogo de referência que ele já registra.

### INV-03 — Vocabulário único

> **Todo termo do glossário aparece, em qualquer página publicada, com a definição do glossário — nunca com uma definição divergente — e nenhum sinônimo proibido aparece em texto publicado.**

Decompõe-se em duas condições:

* **INV-03.a (Consistência de definição):** quando uma página publicada usa um termo do glossário, o sentido em que o usa é o sentido definido aqui. Este épico não verifica automaticamente a *semântica* do uso (isso exigiria compreensão de linguagem natural fora do escopo de um checker Bash com dependência zero — ver nota de honestidade em §5) — mas garante, por revisão editorial no momento da escrita de cada página, que nenhuma página redefine um termo já glossado.
* **INV-03.b (Ausência de sinônimo proibido):** nenhuma das palavras e expressões listadas como `sinônimos_proibidos` de qualquer termo aparece em texto publicado de qualquer página do site, em nenhuma feature. Esta condição **é** verificável estruturalmente por checker automatizado: é busca textual sobre a saída construída.

**Por que isto é invariante e não preferência:** o produto entrega, através deste site, o próprio glossário que instrui agentes de terceiros a operar o método sem alucinar termo. Um site que usa "sprint" para descrever um Épico, ou "guidelines" para as Algemas da IA, contradiz o vocabulário que ele mesmo publica como canônico — a mesma classe de incoerência que INV-05 (autoconsistência, [`team_playbook.md`](../../../../team_playbook.md)) existe para impedir.

**Estado da verificação:** INV-03.b é verificada por um checker de dependência zero, entregue por este épico — ver §5. INV-03.a é verificada editorialmente, com a limitação registrada honestamente.

### INV-04 — Rastreabilidade

> **Toda afirmação sobre o método, em qualquer página de conteúdo publicada, é atribuível a um documento de spec identificável do repositório.**

Decompõe-se em duas condições:

* **INV-04.a (Presença de atribuição):** cada página de conteúdo dos épicos `01`–`05` desta feature cita, ao menos uma vez, o documento de spec de onde a afirmação central da página deriva — pelo caminho do arquivo no repositório (`index.md`, `team_playbook.md`, `features/03-manual-do-metodo/...`, etc.). Isto é verificado editorialmente: cada `tasks.md` desta feature inclui uma tarefa de conferência de citação antes do fechamento do épico.
* **INV-04.b (Existência do documento citado):** todo caminho de arquivo citado como fonte resolve para um arquivo que de fato existe no repositório. Esta condição **já é verificada estruturalmente** pelo checker de INV-02 (integridade referencial) entregue pela feature `01` ([`apps/site/scripts/check_invariants.sh`](../../../../apps/site/scripts/check_invariants.sh)), que varre todo texto publicado em busca de referências a `features/`, `apps/`, `assets/`, `.agents/` e nomes de arquivo `*.md`, e reprova a publicação se algum não existir. INV-04.b é, portanto, um **subconjunto** do que INV-02.b já garante — este épico não duplica esse checker; apenas reconhece que citar a fonte (INV-04.a) é uma exigência editorial adicional, e que a integridade da citação (INV-04.b) já tem cobertura automatizada herdada da feature `01`.

**Por que isto é invariante e não preferência:** um manual do método que afirma coisas sobre o método sem apontar de onde vêm é indistinguível de opinião. A feature `05` (prova viva, fora do escopo deste trabalho) depende de que o manual já tenha esse hábito de citação — se `03` não citar suas fontes, `05` não tem o que costurar.

**Nota de honestidade sobre o limite da verificação automatizada de INV-04.a:** decidir se uma citação presente numa página *de fato sustenta* a afirmação que a antecede é um julgamento semântico. Um checker Bash de dependência zero não pode fazer esse julgamento sem produzir falsos positivos ou negativos — e um checker que aprova sem ter verificado de verdade é, pela própria doutrina do [`technical_agreement.md`](../../../../technical_agreement.md) §4.1, pior que nenhum checker. Por isso, **a implementação de um checker estrutural de INV-04.a fica registrada aqui como trabalho futuro, não fabricada agora**: o que este épico entrega é a exigência editorial (tarefa em `tasks.md` de cada épico) e a verificação automática do fragmento que é genuinamente verificável por texto — a existência do documento citado (INV-04.b, via o checker de INV-02 já existente).

---

## 3. Eventos de Domínio (Domain Events)

**Nenhum evento de domínio.** O glossário não muda em tempo de execução — é compilado uma única vez, junto com o resto do site, e não há consumidor de uma mudança de definição além do próprio processo editorial humano que aprova o `plan.md`. Registrar um evento `TermoGlossado` seria o mesmo erro já identificado e evitado nos épicos `01` e `02` da feature `01`: um emissor sem receptor.

---

## 4. Casos de Uso / Comandos e Consultas (Use Cases)

**Nenhum caso de uso em tempo de execução.** O que existe é a **regra de derivação editorial** que rege como este glossário é usado pelos épicos seguintes:

> Todo termo usado numa página de conteúdo das features `02`–`06` que corresponda a um conceito glossado aqui **deve** usar a tradução publicada (`termo_publicado`) deste documento, nunca um sinônimo proibido. Quando um épico consumidor precisa de um termo ainda não glossado, a extensão do glossário — não a criação paralela de vocabulário — é o caminho correto.

Essa regra é o que torna INV-03 sustentável ao longo do tempo: o glossário é a única fonte de tradução, e estender vocabulário é sempre uma edição deste arquivo, nunca uma decisão local de uma página de conteúdo.

---

## 5. O Glossário — Linguagem Ubíqua do Método Liquid

Nove termos centrais, extraídos do corpus. Para cada um: definição exata, sinônimos proibidos (português e inglês, porque o site publica em inglês mas o corpus de origem e o vocabulário de quem já conhece o método estão em português) e relações. A justificativa de tradução para o inglês acompanha cada termo cunhado em português pelo corpus.

### `Workspace`
* **Termo original:** `workspace` — o próprio corpus já usa a palavra em inglês, sem tradução, mesmo escrevendo em português (`index.md` subtítulo: "Documento Mestre de Governança e Navegação do **Workspace**"; `.agents/hermes_bootstrap.md`:23, prompt de ativação: "Este é um **workspace** Liquid v1 recém-inicializado"). Não há decisão de tradução a justificar aqui.
* **Definição:** O contêiner isolado por produto — uma única sessão de agente opera exclusivamente dentro dele. Fonte: `README.md` Pilar 1, "Isolamento Absoluto por Workspace": "Um workspace (contêiner) isolado por produto (`$HOME/product_design/meuproduto/`). Sem monorepos genéricos, blindando o raio de explosão e mitigando alucinações de contexto."
* **Sinônimos proibidos:** `monorepo`, `generic project folder`, `pasta genérica de projeto`.
* **Relações:** contém os documentos de governança de raiz, `features/`, `apps/`, `assets/` e `.agents/`. É o escopo de aplicação do pilar de Isolamento Absoluto.

### `Feature`
* **Termo original:** `feature` — também loanword em inglês no corpus português (`features/[nome_da_feature]/`).
* **Definição:** Fatia vertical de valor de negócio, delimitada em `features/<id>-<nome>/`, com `index.md` (escopo de negócio), `feat_roadmap.md`, `quick_status.md` e `epics/`. Fonte: [`features/README.md`](../../../../features/README.md) §"Hierarquia e Padronização" e subtítulo "A Gestão Ágil Nativa na Árvore de Diretórios".
* **Sinônimos proibidos:** `épico` / `epic` (granularidade diferente — ver abaixo), `sprint`, `user story` / `história de usuário` (uma feature contém histórias de usuário, não é uma).
* **Relações:** decompõe-se em um ou mais `Épico`; sua `index.md` é uma `Âncora`; seu conteúdo aprovado se torna, via épicos, `Código Consequencial` em `apps/`.

### `Épico` (Epic)
* **Termo original:** `épico`.
* **Definição:** Pacote atômico de entrega dentro de uma `Feature`, em `features/<feature>/epics/<epico>/`, com `index.md` (Bounded Context e critérios de aceite), `plan.md` (o `Domain Enabler`), `tasks.md`, `quick_status.md` e `epic_roadmap.md`. Fonte: [`features/README.md`](../../../../features/README.md) §"Hierarquia" e [`README.md`](../../../../README.md) "Anatomia do Repositório".
* **Sinônimos proibidos:** `sprint`, `história de usuário` / `user story`, `tarefa` / `task` (uma tarefa é um item atômico dentro de `tasks.md`, não o épico inteiro), `feature`.
* **Relações:** pertence a exatamente uma `Feature`; seu `plan.md` é modelado pelo `Domain Enabler`; sua `tasks.md` produz `Código Consequencial` sob supervisão do Task Executor.

### `Spec`
* **Termo original:** `especificação` / `spec` — ambos usados no corpus (`README.md`:3, tagline: "A especificação é o software"; `index.md`:36: "a spec é o contrato executável").
* **Definição:** Qualquer documento Markdown estruturado que constitui o contrato executável de intenção de negócio e domínio — os documentos de governança de raiz e os documentos de `features/`/`epics/`. É o patrimônio duradouro do produto, em oposição ao código, que é consequência. Fonte: `README.md` §"O Que é o Spec-Driven Development (Liquid)?", item 1: "A Documentação é o Contrato Executável: o patrimônio duradouro do produto é a intenção de negócio, o domínio e as especificações imutáveis escritas em Markdown estruturado."
* **Sinônimos proibidos:** `documentação auxiliar` / `supplementary documentation` (inverte a hierarquia: a spec não é auxiliar a nada, é o próprio software), `comentário de código` / `code comment`, `PRD` (formato de outra metodologia, não usado aqui).
* **Relações:** toda `Feature` e todo `Épico` produzem specs; um `Manifesto` é uma spec de escopo restrito à aplicação em `apps/`; `Código Consequencial` deriva de specs, nunca o inverso.

### `Manifesto` (`app_liquid.md`)
* **Termo original:** `manifesto` (`app_liquid.md`).
* **Definição:** Camada de metadados agnóstica de linguagem que toda aplicação em `apps/` deve conter na raiz, declarando stack, propósito, ponto de entrada e escopo de dependências — dispensando o agente de varrer árvores sintáticas profundas. Fonte: `index.md` §2, item 2: "O Manifesto Universal (`app_liquid.md`): Criamos uma camada de metadados agnóstica para as aplicações físicas dentro de `apps/`."; [`apps/README.md`](../../../../apps/README.md) §"A Regra de Ouro".
* **Sinônimos proibidos:** `README` (um README é prosa para leitura humana; o manifesto é estrutura para consumo por agente — os dois coexistem e têm papéis diferentes, como prova o próprio `apps/site` ter ambos), `config file` / `arquivo de configuração` genérico, `package.json`.
* **Relações:** vive dentro de uma aplicação física, uma instância de `Código Consequencial`; sua stack declarada deve ser idêntica à homologada em `technical_agreement.md` §1.

### `Âncora` (Anchor, `index.md`)
* **Termo original:** `âncora` / `âncoras programáticas`.
* **Justificativa da tradução:** "Anchor" é tradução literal e direta; o corpus já usa a metáfora de ancoragem em inglês implicitamente ao nomear o pilar "Navegação Baseada em Âncoras Programáticas", e "Anchor" preserva a mesma imagem de ponto fixo de referência.
* **Definição:** Arquivo `index.md`, presente em cada nível hierárquico do workspace (raiz, feature, épico), que serve como ponto de navegação e ancoragem semântica, otimizado para busca de alta precisão e baixo consumo de tokens por LLMs. Fonte: `index.md` §2, item 3: "Navegação Baseada em Âncoras Programáticas (`index.md`): Substituímos nomenclaturas fragmentadas por uma taxonomia limpa e hierárquica baseada em `index.md`... otimizada especificamente para buscas semânticas de alta precisão e consumo de tokens por LLMs."; [`features/README.md`](../../../../features/README.md) §"Hierarquia e Padronização".
* **Sinônimos proibidos:** `README` (papéis distintos, ver acima), `sumário` / `table of contents`, `mapa do site` / `sitemap`.
* **Relações:** existe em todo nível — `Workspace`, `Feature`, `Épico`; é o ponto de "Contextualização" no fluxo do agente ([`index.md`](../../../../index.md) §4, passo 1).

### `Algemas da IA` (AI Handcuffs)
* **Termo original:** `Algemas da IA`.
* **Justificativa da tradução:** "AI Handcuffs" é a tradução literal escolhida, e deliberadamente não amaciada. O corpus usa um registro assertivo de propósito ("Este arquivo é o contrato técnico **inegociável**"), e alternativas mais neutras em inglês — "guardrails", "constraints", "guidelines" — perdem exatamente a conotação de restrição física e inegociável que o termo original carrega. "Handcuffs" preserva a imagem.
* **Definição:** O conjunto de restrições inegociáveis que os agentes autônomos nunca devem violar — ações proibidas e padrões obrigatórios —, registrado em `technical_agreement.md` §2. Fonte: [`technical_agreement.md`](../../../../technical_agreement.md) §2, "🛡️ As 'Algemas da IA' (Fronteiras e Restrições Inegociáveis)": "Os Agentes Autônomos **NUNCA** devem violar as seguintes regras."
* **Sinônimos proibidos:** `guidelines` / `diretrizes` (sugerem opcionalidade; as Algemas são inegociáveis), `best practices` / `boas práticas`, `regras` sozinho sem qualificação (termo genérico demais para nomear especificamente este conjunto).
* **Relações:** vivem em `technical_agreement.md`, um documento de `Spec`; regem toda produção de `Código Consequencial`; sua violação é o critério que reprova um épico no Definition of Done.

### `Domain Enabler`
* **Termo original:** `Domain Enabler` — já em inglês no corpus.
* **Definição:** Usado em dois sentidos inseparáveis no corpus, ambos preservados aqui: **(a)** o papel do agente de IA que analisa a intenção de negócio e modela o DDD conceitual em `plan.md` — fonte: [`team_playbook.md`](../../../../team_playbook.md) §1, "**Domain Enabler (Hermes / Architect Agent)** | Agente de IA | Analisa a intenção de negócio, modela o DDD conceitual em `plan.md`..."; **(b)** o próprio documento `plan.md`, cujo título interno em todo épico do repositório é literalmente "Domain Enabler (Conceptual DDD Plan): [nome-do-épico]". O papel produz o documento; o documento carrega o nome do papel.
* **Sinônimos proibidos:** `Product Owner` (papel humano diferente — dono da visão, não modelador de domínio), `database designer` / `modelador de banco de dados` (o Domain Enabler explicitamente não modela ORM, SQL ou schema — `index.md` §1), `arquiteto de dados`.
* **Relações:** produz o `plan.md` de um `Épico`; opera sob aprovação do Arquiteto Supremo / Tech Lead humano; suas entidades e invariantes (quando existem) alimentam `tasks.md`.

### `Código Consequencial` (Consequential Code)
* **Termo original:** `Código Consequencial` / `código consequencial e descartável`.
* **Justificativa da tradução:** "Consequential Code" é cognato direto e preserva a estrutura filosófica exata do termo original — código como *consequência* da spec, não como ativo em si. Alternativas como "generated code" ou "disposable code" capturam só uma das duas propriedades (geração, descartabilidade); "Consequential Code" nomeia a relação causal completa: a spec é a causa, o código é a consequência.
* **Definição:** O software físico gerado em `apps/` a partir das specs — estritamente descartável e regenerável a qualquer momento; não é o patrimônio duradouro do produto. Fonte: `README.md` §"O Que é...", item 2: "O Código é Consequência: O código físico gerado na pasta `apps/` é descartável e regenerável a qualquer momento a partir das specs."; `index.md`:5: "o código-fonte torna-se estritamente consequencial e descartável."
* **Sinônimos proibidos:** `legacy code` / `código legado`, `source of truth` / `fonte da verdade` (a spec é a fonte da verdade; o código nunca é), `produto` sozinho sem qualificação (o código não é o produto — o método e suas specs são).
* **Relações:** vive em `apps/`, sempre acompanhado de um `Manifesto`; é produzido a partir de `tasks.md`, que deriva de um `plan.md` aprovado; sua ausência ou regeneração completa não altera o patrimônio do produto.

---

## 6. Termos de Apoio (usados pelos épicos `02`–`04`, já presentes no corpus)

Estes termos não fazem parte da lista mínima exigida, mas são consumidos diretamente pelos épicos `02` (paradigma), `03` (ciclo de vida) e `04` (anatomia e Algemas) desta feature. Registrá-los aqui, com a mesma fonte e o mesmo rigor, evita que cada épico consumidor tenha de inventar sua própria tradução — o que violaria a própria regra de derivação de §4.

| Termo (EN) | Termo original (PT) | Definição resumida | Fonte |
| :--- | :--- | :--- | :--- |
| `Bounded Context` | `Bounded Context` (já em inglês) | Os limites de onde uma regra de negócio começa e termina. | `index.md` §1 |
| `Ubiquitous Language` | `Linguagem Ubíqua` | Os termos exatos que negócio e agentes de IA devem usar em conjunto — este glossário é a instância concreta dela para o método Liquid. | `index.md` §1 |
| `Conceptually-Strict DDD` | `DDD Estritamente Conceitual` | O recorte de DDD adotado: foco em Bounded Contexts, Linguagem Ubíqua, Entidades/Invariantes e Eventos de Domínio, sem tabelas, ORM ou migrations. | `index.md` §1; `README.md` §"O Que é..." item 3 |
| `Domain Invariant` | `Regra de Negócio Invariante` | Comportamento central e não-negociável do sistema — quando existe; épicos sem domínio declaram sua ausência (§4.1 do `team_playbook.md`). | `index.md` §1; `team_playbook.md` §4.1 |
| `Domain Event` | `Evento de Domínio` | O que acontece e quem deve reagir quando um estado crítico muda. | `index.md` §1 |
| `Definition of Ready (DoR)` | `Definition of Ready (DoR)` | Checklist que autoriza o início da execução de código de um épico. | `team_playbook.md` §3 |
| `Definition of Done (DoD)` | `Definition of Done (DoD)` | Checklist que autoriza marcar um épico como concluído. | `team_playbook.md` §4 |
| `Chief Architect / Tech Lead` | `Arquiteto Supremo / Tech Lead` | Papel humano: define a visão de produto, aprova `plan.md`, valida acordos técnicos. | `team_playbook.md` §1 |
| `Task Executor` | `Task Executor` (já em inglês) | Papel do agente de IA que executa `tasks.md` e gera `Código Consequencial`. | `team_playbook.md` §1 |
| `Reviewer & QA` | `Reviewer & QA` (já em inglês) | Papel humano + scripts: audita, valida critérios de aceite, aprova commits. | `team_playbook.md` §1 |

Estes dez termos de apoio seguem a mesma regra de INV-03: uma vez publicados, seus sinônimos óbvios (`sprint`, `story`, `product manager` no lugar de `Chief Architect / Tech Lead`, etc.) não devem aparecer em texto publicado. Não recebem tabela de sinônimos proibidos individual aqui para não inflar o escopo além do que os épicos `02`–`04` realmente vão usar — cada um, ao consumir um destes termos, cita esta seção como fonte (cumprindo INV-04).

---

## 7. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1: a suíte verde é obrigatória mesmo quando o domínio é magro ou, como aqui, real mas não transacional. Este épico é concluído quando:

1. Os nove termos centrais e os dez termos de apoio estão definidos com fonte identificável — nenhuma definição inventada.
2. INV-03 e INV-04 estão enunciadas como regras verificáveis, com a parte estruturalmente verificável (INV-03.b, INV-04.b) coberta por checker automatizado, e a parte editorial (INV-03.a, INV-04.a) registrada honestamente como tal, sem fingir automação que não existe.
3. O checker de INV-03.b entregue em `tasks.md` passa sobre o site construído com a página do glossário publicada, e reprova comprovadamente diante de um sinônimo proibido semeado — a mesma prova em duas direções já exigida da feature `01`.
4. A página do glossário está publicada em inglês, com cada termo original em português citado, cumprindo a decisão do capitão registrada em [`../../../01-fundacao-publicacao/index.md`](../../../01-fundacao-publicacao/index.md) §6.1 e herdada em [`../../index.md`](../../index.md) §6.1.

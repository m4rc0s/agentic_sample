# Feature Spec: 03-manual-do-metodo

> **Visão Geral e Escopo de Negócio da Funcionalidade**

---

## 1. Proposta de Valor e Problema do Usuário

* **O Problema:** Depois que a feature `01` torna a publicação possível e a feature `02` desperta o interesse de um visitante em 30 segundos, esse mesmo visitante — agora em modo de avaliação séria — não tem onde aprofundar. O vocabulário autoral do método ("Algemas da IA", "Código Consequencial", "Domain Enabler", "Âncora") existe hoje espalhado por sete documentos de governança sem uma fonte única, e nenhum desses documentos foi escrito para quem está avaliando o método de fora. Sem um manual, a única forma de entender o Liquid a fundo é ler o repositório inteiro — o que essa mesma pessoa está tentando decidir se vale a pena fazer.
* **O Valor Entregue:** Passa a existir um manual do método: o glossário canônico da Linguagem Ubíqua do Liquid, a tese do paradigma (spec como software, DDD estritamente conceitual), o ciclo de vida com papéis humano/agente, o mapa do workspace com as Algemas da IA, e o posicionamento frente ao ecossistema de referência (Spec-Kit, OpenSpec/SpecDD, The SDD Standard). Quem lê o manual entende o método com seriedade, sem precisar abrir o repositório — e qualquer agente de IA de terceiros que precise operar o método pode usar estas páginas como fonte de vocabulário.
* **Persona Impactada:** O mesmo Tech Lead / arquiteto da feature `02`, agora em modo de avaliação aprofundada. Secundariamente, o agente de IA de terceiros que lerá estas páginas para operar o método sobre um novo produto.

**Natureza da feature:** conteúdo núcleo. Diferente das features `02`, `04` e `05`, o épico `01` desta feature contém o **único domínio conceitual genuíno do produto** (relatório de plano, §2.1): a Linguagem Ubíqua do próprio método Liquid, com definições exatas, sinônimos proibidos e relações entre termos. É por isso que esta feature é fonte de verdade de vocabulário para as demais — e por isso o épico `01` é dependência rígida das features `02`, `04`, `05` e `06`/épico `03` (relatório de plano, §4.1): publicar conteúdo antes do glossário canônico existir garante retrabalho de vocabulário.

---

## 2. Escopo Funcional e Limites (In / Out of Scope)

### ✅ No Escopo:
- O glossário canônico da Linguagem Ubíqua do método, com definição exata, sinônimos proibidos e relações, extraído do corpus autoral existente — não inventado.
- A página do paradigma: por que a spec é o software e o código é consequência; o que significa "DDD estritamente conceitual"; o que fica explicitamente de fora do DDD neste método (ORM, SQL, migrations).
- A página do ciclo de vida: as etapas do fluxo de trabalho do agente, os papéis humano/agente, e o Definition of Ready e Definition of Done.
- A página da anatomia do workspace: o mapa dos arquivos de raiz, `features/`, `epics/`, `apps/`, `assets/`, a função das âncoras `index.md`, e as Algemas da IA com o porquê de cada restrição.
- A página de posicionamento no ecossistema: o que o Liquid partilha e o que acrescenta frente a GitHub Spec-Kit, OpenSpec/SpecDD e The SDD Standard, com links vivos para as três iniciativas.
- As invariantes de vocabulário e rastreabilidade (INV-03, INV-04) enunciadas como regras verificáveis, no mesmo padrão de invariante de publicação já adotado pela feature `01`.
- Publicação de verdade das cinco páginas em `apps/site/content/`, em inglês, usando somente os componentes visuais já entregues pela feature `01`.

### ❌ Fora do Escopo (Fronteiras Explícitas):
- O passo a passo executável de adoção (quickstart, prompt book publicado, referência de scaffold) — pertence à feature `04`.
- O estudo de caso da trilha de specs deste próprio site — pertence à feature `05`.
- Tutorial de DDD em geral: o manual explica o recorte conceitual que o Liquid faz do DDD, não ensina DDD do zero.
- Comparação com metodologias fora do movimento spec-first (Scrum, SAFe, XP, etc.).
- Crítica a ferramentas de terceiros nomeadas — o posicionamento frente ao ecossistema é diferencial, não confronto.
- Resolver a tensão de idioma entre o corpus de spec (português) e o site (inglês) — registrada em [`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md) §6.1 como decisão em aberto do capitão. Esta feature mantém a nota coerente com o que já foi registrado ali; não a duplica e não a resolve.
- Hospedagem, domínio próprio e deploy — decisões do capitão adiadas, como na feature `01`.
- Qualquer trabalho de identidade visual, logo, paleta nova ou componente de UI novo — usa estritamente o sistema visual já entregue pela feature `01`.

---

## 3. Histórias de Usuário Chave (User Stories)

* **US-01:** Como **Tech Lead avaliando o método**, eu quero um glossário único com definição exata de cada termo para que **eu não precise inferir o vocabulário lendo sete documentos diferentes**.
* **US-02:** Como **Tech Lead avaliando o método**, eu quero entender por que a spec é o software e o que fica de fora do DDD para que **eu consiga julgar se o recorte conceitual serve para o meu produto**.
* **US-03:** Como **Tech Lead avaliando o método**, eu quero ver as etapas do ciclo com os papéis humano/agente e o DoR/DoD para que **eu saiba exatamente onde a decisão humana entra e onde o agente atua sozinho**.
* **US-04:** Como **Tech Lead avaliando o método**, eu quero um mapa do workspace com as Algemas da IA explicadas para que **eu entenda as restrições antes de adotar, não depois**.
* **US-05:** Como **Tech Lead avaliando o método**, eu quero saber o que o Liquid acrescenta frente a Spec-Kit, OpenSpec e The SDD Standard para que **eu não avalie o método como se fosse uma invenção isolada**.
* **US-06:** Como **agente de IA de terceiros**, eu quero uma fonte única de vocabulário canônico para que **eu opere o método sem alucinar termo ou sinônimo proibido**.

---

## 4. Decomposição em Épicos de Domínio (`epics/`)

Esta feature é subdividida nos seguintes pacotes atômicos de valor, executados em pipeline a partir do glossário:

1. **[`epics/01-modelo-de-conteudo-e-linguagem-ubiqua/`](epics/01-modelo-de-conteudo-e-linguagem-ubiqua/index.md):** O glossário canônico da Linguagem Ubíqua do método — termos, definições exatas, sinônimos proibidos, relações — e a definição de INV-03 e INV-04 como regras verificáveis. *Domínio conceitual: o único domínio real do produto.*
2. **[`epics/02-paradigma-spec-como-software/`](epics/02-paradigma-spec-como-software/index.md):** A tese aprofundada — spec como contrato executável, código como consequência — e o recorte do DDD estritamente conceitual. *Domínio conceitual: nenhum. Consome o glossário de `01`.*
3. **[`epics/03-ciclo-de-vida-e-papeis/`](epics/03-ciclo-de-vida-e-papeis/index.md):** As etapas do ciclo de trabalho do agente, os papéis humano/agente, e o Definition of Ready e Definition of Done. *Domínio conceitual: nenhum. Consome o glossário de `01`.*
4. **[`epics/04-anatomia-do-workspace-e-algemas/`](epics/04-anatomia-do-workspace-e-algemas/index.md):** O mapa de arquivos do workspace e as Algemas da IA, com o porquê de cada restrição. *Domínio conceitual: nenhum. Consome o glossário de `01`.*
5. **[`epics/05-posicionamento-no-ecossistema/`](epics/05-posicionamento-no-ecossistema/index.md):** O que o Liquid partilha e acrescenta frente a Spec-Kit, OpenSpec/SpecDD e The SDD Standard. *Domínio conceitual: nenhum.*

---

## 5. Critérios de Aceitação Gerais da Feature

- [ ] Critério 1: Os cinco épicos existem com `index.md`, `plan.md`, `tasks.md`, `quick_status.md` e `epic_roadmap.md` preenchidos, sem placeholder residual.
- [ ] Critério 2: O `plan.md` do épico `01` é um glossário real — termos, definições exatas extraídas do corpus, sinônimos proibidos, relações — e define INV-03 e INV-04 como regras verificáveis por checker.
- [ ] Critério 3: Os `plan.md` de `02`–`05` são honestos sobre ausência de domínio conceitual, no mesmo padrão da feature `01`.
- [ ] Critério 4: As cinco páginas de conteúdo estão publicadas em inglês em `apps/site/content/`, construídas pelo Hugo, usando somente componentes visuais já existentes.
- [ ] Critério 5: A página do glossário traz a tradução para inglês de cada termo com o termo original em português citado.
- [ ] Critério 6: O checker de INV-01/INV-02 da feature `01` continua passando no site com o novo conteúdo.
- [ ] Critério 7: Nenhuma feature além da `03` foi tocada.

---

## 6. Decisões do Capitão — Estado

### 6.1 🟡 HERDADA, EM ABERTO — Tensão de idioma no glossário
**Decisão relacionada já tomada:** o site nasce em inglês; o corpus de spec permanece em português ([`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md) §6.1).

**Como esta feature convive com ela:** a página do glossário — o conteúdo mais dependente de vocabulário autoral exato — publica a tradução em inglês de cada termo com o termo original em português citado entre parênteses ou em nota, para que quem já conhece o corpus em português reconheça o conceito. Isso preserva a decisão do capitão sem tomar partido na tensão registrada. Esta feature não resolve a decisão nem duplica o registro dela.

### 6.2 ✅ HERDADA, FECHADA — Onde o site vive, stack e DoD sem domínio de negócio
Idênticas às decisões §6.3, §6.4 e §6.6 de [`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md). Esta feature não reabre nenhuma delas.

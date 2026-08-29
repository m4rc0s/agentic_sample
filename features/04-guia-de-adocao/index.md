# Feature Spec: 04-guia-de-adocao

> **Visão Geral e Escopo de Negócio da Funcionalidade**

---

## 1. Proposta de Valor e Problema do Usuário

* **O Problema:** Depois que a feature `02` convence o visitante em 30 segundos e a feature `03` ensina o método com seriedade, essa mesma pessoa — agora convencida — não tem um caminho executável de adoção. O que existe hoje só existe dentro do repositório: os quatro comandos de `README.md` §"Como Usar Este Template", os seis prompts de `.agents/prompts_guide.md`, os três comandos de `scripts/scaffold.sh`, e os checklists de DoR/DoD de `team_playbook.md` §3–4. Quem decidiu adotar precisa clonar o repositório e ler seis arquivos soltos para descobrir a ordem certa. Sem esta feature, o manual explica o método, mas ninguém sai dele sabendo literalmente o que digitar primeiro.
* **O Valor Entregue:** Passa a existir um caminho executável, publicado, que leva do zero até o primeiro `plan.md` aprovado sem que a pessoa precise abrir o repositório: um quickstart do caminho feliz completo, o prompt book das seis etapas do ciclo em formato copiável e idêntico ao original, e uma referência dos três comandos de `scaffold.sh` com os checklists de DoR e DoD publicados. A feature também entrega uma nota honesta e verificada sobre quais agentes de IA o repositório de fato suporta hoje — não a lista aspiracional de `README.md`.
* **Persona Impactada:** O **adotante** — o mesmo Tech Lead / arquiteto das features `02` e `03`, agora convencido e querendo começar hoje.

**Natureza da feature:** ativação. Diferente da feature `03` (que ensina o método), esta feature **executa** o método diante do visitante — cada comando e cada prompt publicado aqui foi de fato rodado, não descrito de memória.

---

## 2. Escopo Funcional e Limites (In / Out of Scope)

### ✅ No Escopo:
- O quickstart: criar o workspace a partir do template, inicializar o contexto base (os quatro arquivos de governança de raiz), subir a sessão isolada do agente, até ter um primeiro `plan.md` aprovado.
- O prompt book publicado: os seis prompts de `.agents/prompts_guide.md`, em formato copiável, **idênticos** ao arquivo de origem — sem paráfrase.
- A referência de `scaffold.sh`: os três comandos (`feature`, `epic`, `app`), cada um executado de verdade, com a saída real documentada.
- Guia de preenchimento dos documentos de governança de raiz: o que cada um responde e em que ordem preencher.
- Os checklists de Definition of Ready e Definition of Done, publicados a partir de `team_playbook.md` §3–4.
- Uma nota honesta sobre quais agentes de IA o repositório realmente documenta hoje — verificada em `AGENTS.md` e `CLAUDE.md` como eles existem em `main`, não copiada de `README.md` sem checar.
- Publicação de verdade das três páginas em `apps/site/content/en/guide/`, usando somente os componentes visuais já entregues pela feature `01`.

### ❌ Fora do Escopo (Fronteiras Explícitas):
- Instalação ou configuração de qualquer agente de IA específico (Claude Code, Cursor, Copilot, Antigravity) — o site aponta para a documentação oficial de cada um, não a duplica.
- Suporte, canal de dúvidas, comunidade ou fórum.
- Vídeos, cursos ou material pago.
- Templates alternativos ou variações do método.
- Corrigir a referência quebrada de `AGENTS.md` a `techinal_deal.md` (achado pré-existente, fora do escopo desta feature) — a página de conteúdo cita o nome real, `technical_agreement.md`, sem repetir o erro nem consertá-lo na fonte.
- Qualquer trabalho de identidade visual, logo, paleta nova ou componente de UI novo — usa estritamente o sistema visual já entregue pela feature `01`.
- Hospedagem, domínio próprio e deploy — decisões do capitão adiadas, como nas features `01` e `03`.

---

## 3. Histórias de Usuário Chave (User Stories)

* **US-01:** Como **adotante**, eu quero um caminho passo a passo do zero até o primeiro `plan.md` aprovado para que **eu não precise inferir a ordem certa lendo o repositório inteiro**.
* **US-02:** Como **adotante**, eu quero copiar os prompts de cada etapa do ciclo exatamente como o método os define para que **eu não introduza uma variação que desalinha meu agente do método real**.
* **US-03:** Como **adotante**, eu quero saber exatamente o que cada comando de `scaffold.sh` produz antes de rodá-lo para que **eu não seja surpreendido pela estrutura de arquivos gerada**.
* **US-04:** Como **adotante**, eu quero os checklists de DoR e DoD publicados para que **eu saiba, antes de começar a codificar, o que precisa estar pronto e o que precisa estar concluído**.
* **US-05:** Como **adotante avaliando risco de adoção**, eu quero saber com precisão quais agentes de IA o repositório hoje realmente documenta para que **eu não descubra depois de adotar que meu agente não tem instrução dedicada**.

---

## 4. Decomposição em Épicos de Domínio (`epics/`)

Esta feature é subdividida nos seguintes pacotes atômicos de valor, executados em pipeline:

1. **[`epics/01-quickstart-do-zero-ao-primeiro-epico/`](epics/01-quickstart-do-zero-ao-primeiro-epico/index.md):** O caminho feliz completo, do template ao primeiro `plan.md` aprovado. *Domínio conceitual: nenhum.*
2. **[`epics/02-prompt-book-publicado/`](epics/02-prompt-book-publicado/index.md):** Os seis prompts do ciclo, publicados em formato copiável e idêntico ao original. *Domínio conceitual: nenhum. Consome o glossário de `03/01`.*
3. **[`epics/03-referencia-de-scaffold-e-checklists/`](epics/03-referencia-de-scaffold-e-checklists/index.md):** Os três comandos de `scaffold.sh`, executados e documentados, mais os checklists de DoR e DoD. *Domínio conceitual: nenhum.*

---

## 5. Critérios de Aceitação Gerais da Feature

- [ ] Critério 1: Os três épicos existem com `index.md`, `plan.md`, `tasks.md`, `quick_status.md` e `epic_roadmap.md` preenchidos, sem placeholder residual.
- [ ] Critério 2: Uma pessoa que nunca viu o repositório consegue chegar ao primeiro `plan.md` seguindo apenas o site.
- [ ] Critério 3: Todo comando publicado foi executado de verdade pelo agente executor e produz a saída documentada — nenhuma saída inventada de memória.
- [ ] Critério 4: Os prompts publicados são idênticos, palavra por palavra, aos de `.agents/prompts_guide.md`.
- [ ] Critério 5: A lista de agentes suportados corresponde ao que `AGENTS.md` e `CLAUDE.md` realmente documentam hoje em `main`, verificada nesta entrega — não copiada de `README.md` sem checar.
- [ ] Critério 6: Todo termo usado é o termo canônico do glossário publicado pela feature `03` (INV-03).
- [ ] Critério 7: As três páginas de conteúdo estão publicadas em inglês em `apps/site/content/en/guide/`, construídas pelo Hugo, usando somente componentes visuais já existentes.
- [ ] Critério 8: O checker de INV-01/INV-02 da feature `01` e o checker de vocabulário (INV-03.b) continuam passando no site com o novo conteúdo.
- [ ] Critério 9: Nenhuma feature além da `04` foi tocada.

---

## 6. Decisões do Capitão — Estado

### 6.1 ✅ HERDADA, FECHADA — Onde o site vive, stack, idioma e DoD sem domínio de negócio
Idênticas às decisões §6.1 (idioma), §6.3 (onde o site vive), §6.4 (DoD) e §6.6 (gerador) de [`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md). Esta feature não reabre nenhuma delas: o site nasce em inglês, vive em `apps/site/`, aceita `plan.md` sem domínio conceitual sob invariantes de artefato, e é construído com Hugo.

### 6.2 ✅ FECHADA NESTA ENTREGA — Nota sobre agentes suportados
**Decisão:** a nota publicada descreve o que `AGENTS.md` (universal, cobre qualquer agente que leia o arquivo) e `CLAUDE.md` (bootstrap específico do Claude Code, que aponta para `AGENTS.md`) documentam hoje em `main` — não a lista de agentes citados em `README.md` §1 ("Hermes, Claude Code, Antigravity, Cursor, Copilot, etc."), que é uma lista de compatibilidade pretendida, não de instrução entregue. Ver [`epics/03-referencia-de-scaffold-e-checklists/plan.md`](epics/03-referencia-de-scaffold-e-checklists/plan.md) para a verificação e a redação exata.

**Achado à parte, fora do escopo desta feature:** `AGENTS.md` ainda referencia o arquivo pelo nome antigo `techinal_deal.md` em dois pontos (item 5 dos Princípios Fundamentais e item 1 do Fluxo de Trabalho Operacional), embora o arquivo tenha sido renomeado para `technical_agreement.md` na feature `01`. É uma referência quebrada pré-existente em `AGENTS.md`; esta feature não a conserta — apenas não a repete, citando `technical_agreement.md` (o nome real) na página de conteúdo.

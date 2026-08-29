# Spec-Driven Development (Liquid): O Código como Consequência (v1)

> **Documento Mestre de Governança e Navegação do Workspace**

A Inteligência Artificial não resolveu a arquitetura; ela apenas automatizou a criação de código. Para extrair o verdadeiro valor dos Agentes de IA, é necessário estabelecer fronteiras claras. Nesta metodologia, **a documentação é o próprio software**. O código-fonte torna-se estritamente consequencial e descartável; a intenção de negócio e o domínio são o verdadeiro patrimônio imutável.

Deixamos de ser artesãos de sintaxe para atuar como modeladores de domínio. O produto centraliza o ciclo de vida, eliminando a fricção entre produto e engenharia e substituindo ferramentas burocráticas por um ecossistema nativo em arquivos Markdown.

---

## 1. O Novo Paradigma do Domain-Driven Design (DDD)

Na v1 do SDD, **removemos o uso da modelagem de dados engessada nos moldes tradicionais do DDD dirigida a banco de dados (*Database-Driven Design*)**. O DDD deixa de ser um mapa de tabelas ou esquemas SQL e passa a ser aplicado **fortemente a nível conceitual**.

### Separação de Níveis de Modelagem:

1. **Definição de Produto & Negócio (`index.md` / PRD):** Foco em *Bounded Contexts*, *Linguagem Ubíqua*, atores, personas e critérios de aceitação (Gherkin/BDD).
2. **Domínio Conceitual (`plan.md`):** Foco em entidades ricas, Value Objects, tipos de dados de domínio (ex: `Money`, `CPF`, `StatusPedido`), invariantes de negócio e eventos de domínio — **sem acoplamento a tabelas SQL, ORMs ou frameworks**.
3. **Implementação & Persistência Física (`tasks.md` & `apps/`):** É **aqui**, no planejamento granular e na implementação das tasks, que são definidos os modelos físicos: tabelas de banco de dados, schemas DDL, migrations, índices, mapeamentos ORM/DAO e DTOs de transporte de API.

Essa separação garante que a inteligência do negócio nunca fique refém de detalhes de infraestrutura ou amarrada a um banco de dados específico, permitindo que a camada de código em `apps/` seja tratada como consequencial e descartável.

---

## 2. O Ecossistema de Referência Global e a Nossa Variação (*Liquid*)

O movimento de *Spec-Driven Development (SDD)* e *Spec-First* não é uma ilha isolada; ele representa a vanguarda atual da engenharia de software guiada por agentes, validada por iniciativas abertas da comunidade global de tecnologia:

* **GitHub Spec-Kit (`github/spec-kit`):** O projeto de referência que padroniza o ciclo de *Constituição → Especificação → Planejamento → Tarefas → Implementação* para multiplataformas de agentes (como Claude Code, Cursor e Copilot) através de rotinas sequenciais (`/speckit.*`).
* **OpenSpec / SpecDD (`specdd.ai`):** O movimento comunitário focado em formatos padronizados de arquivos de especificação e pastas de governança para mitigar alucinações de contexto em IAs.
* **The SDD Standard (`mmanzini/Spec-driven-development`):** Repositórios abertos que formalizam templates de *Product Briefs*, *Steering Docs* e *Feature Specs*.

### O Nosso Modelo (*Liquid*): A Variação Prática e Cirúrgica

Embora compartilhemos da mesma filosofia de que **a spec é o contrato executável e o código é consequência**, a nossa variação (*Liquid*) vai além ao introduzir:

1. **Isolamento Absoluto por Workspace (Contêiner por Produto):** Enquanto muitos padrões misturam contextos ou exigem estruturas complexas em monorepos mal delimitados, o *Liquid* impõe contêineres e sessões rigorosamente isoladas por produto, blindando o raio de explosão e eliminando conflitos de Git.
2. **O Manifesto Universal (`app_liquid.md`):** Criamos uma camada de metadados agnóstica para as aplicações físicas dentro de `apps/`. Isso dispensa o agente de varrer árvores sintáticas profundas para entender a stack, o propósito e o *entrypoint* de cada software gerado.
3. **Navegação Baseada em Âncoras Programáticas (`index.md`):** Substituímos nomenclaturas fragmentadas por uma taxonomia limpa e hierárquica baseada em `index.md`, otimizada especificamente para buscas semânticas de alta precisão e consumo de tokens por LLMs.

Com essa base, unimos as melhores práticas globais do *Spec-First* a um método enxuto e focado estritamente na intenção de negócio.

---

## 3. Mapa de Navegação e Arquivos de Governança

Abaixo estão os pontos de ancoragem centrais deste workspace:

| Documento | Função / Responsabilidade |
| :--- | :--- |
| [`product_vision.md`](product_vision.md) | Visão macro, problema central, público-alvo, modelo de negócio e métricas de sucesso. |
| [`roadmap.md`](roadmap.md) | Direcionamento estratégico, fases de maturidade e marcos globais de entrega. |
| [`architecture.md`](architecture.md) | Padrões sistêmicos, C4 Model abstrato, fronteiras de contexto e integrações. |
| [`techinal_deal.md`](techinal_deal.md) | Acordos técnicos, restrições inegociáveis, stack homologada e algemas da IA. |
| [`team_playbook.md`](team_playbook.md) | Regras de engajamento, rituais com agentes, critérios de aceitação e Definition of Done. |
| [`AGENTS.md`](AGENTS.md) | Instruções universais e princípios inegociáveis para todos os agentes de IA. |
| [`CLAUDE.md`](CLAUDE.md) | Bootstrap de inicialização e proxy nativo para sessões do Claude Code. |
| [`quick_status.md`](quick_status.md) | Painel executivo de status em tempo real (Ready, WIP, Blocked, Done). |
| [`assets/`](assets/README.md) | Repositório de documentos visuais, wireframes, esquemas e assets de design. |
| [`apps/`](apps/README.md) | Camada física: códigos consequenciais e manifestos `app_liquid.md`. |
| [`features/`](features/README.md) | Módulos de domínio fatiados em features verticais e épicos atômicos. |

---

## 4. O Fluxo de Trabalho do Agente de IA

1. **Contextualização:** O agente lê `index.md`, `product_vision.md`, `architecture.md` e `techinal_deal.md`.
2. **Definição de Feature:** Criação da pasta `features/[nome_da_feature]/index.md` delimitando o valor de negócio.
3. **Modelagem de Épico (`plan.md`):** O agente propõe o DDD conceitual (Entidades, Invariantes, Eventos). O Tech Lead / Arquiteto revisa.
4. **Fila Operacional (`tasks.md`):** O plano aprovado é fatiado em tarefas atômicas sequenciais.
5. **Execução de Código (`apps/` & `app_liquid.md`):** O agente gera a implementação consequencial dentro de `apps/`.
6. **Auditoria Contínua (`quick_status.md`):** Atualização dos rastros de execução locais e globais.

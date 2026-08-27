# Módulo de Features (`features/`)

> **"A Gestão Ágil Nativa na Árvore de Diretórios"**

No modelo **Liquid SDD**, a burocracia de ferramentas externas (Jira, Trello, Notion desconectados) é eliminada. A gestão ágil acontece diretamente na árvore de diretórios, onde cada pasta de funcionalidade atua como um agregador de valor de negócio.

---

## 🏗️ Hierarquia e Padronização do `index.md`

Adotamos arquivos **`index.md`** como âncoras universais em cada nível para otimizar a indexação semântica e consumo de tokens por LLMs:

```text
features/
└── [nome_da_feature]/
    ├── index.md             # Visão geral da funcionalidade, escopo de negócio e valor
    ├── feat_roadmap.md      # Marcos e passos específicos para entregar a feature completa
    ├── quick_status.md      # Status atualizado da feature (Ready, WIP, Blocked, Done)
    └── epics/               # Divisão da feature em pacotes atômicos de entrega
        └── [nome_do_epico]/
            ├── index.md         # Escopo detalhado do Épico, Bounded Contexts e Critérios de Aceite
            ├── plan.md          # Enabler de Domínio: DDD conceitual (Regras, Eventos, Entidades)
            ├── tasks.md         # Fila de Tarefas Atômicas e operacionais para o Agente executar
            ├── quick_status.md  # Rastro local de auditoria e status de andamento deste épico
            └── epic_roadmap.md  # Planejamento tático de execução das entregas deste épico
```

---

## 🔄 Ciclo de Vida de uma Feature

1. **Criação da Feature:** Defina o valor de negócio e escopo em `features/[nome]/index.md`.
2. **Decomposição em Épicos:** Divida a feature em entregas atômicas na pasta `epics/`.
3. **Modelagem de Domínio (`plan.md`):** O agente propõe o DDD conceitual (Entidades, Invariantes, Eventos). O Tech Lead humano aprova.
4. **Fila de Tarefas (`tasks.md`):** Decomposição em tarefas unitárias executáveis.
5. **Implementação Consequencial (`apps/`):** O agente codifica e testa guiado pelas tarefas.
6. **Auditoria (`quick_status.md`):** Atualização de status e fechamento.

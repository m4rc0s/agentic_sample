# Quick Status: [Nome do Produto]

> **Painel de Controle Global do Workspace (Substituto Moderno de Dashboards)**  
> **Última Atualização:** 2026-08-29 | **Status Geral do Produto:** `Ready`

---

## 🚦 Status Macro por Fase

| Fase | Objetivo | Status | Progresso |
| :--- | :--- | :--- | :--- |
| **Fase 0: Fundação & Specs** | Governança, arquitetura e acordos técnicos | `Ready` | 100% |
| **Fase 1: MVP Core** | Implementação das funcionalidades primárias | `Planejado` | 0% |
| **Fase 2: Expansão** | Recursos secundários e otimizações | `Backlog` | 0% |

---

## 📦 Radar de Features & Épicos Ativos

| Feature | Épico Ativo | Responsável | Status | Bloqueios |
| :--- | :--- | :--- | :--- | :--- |
| `[template_feature]` | `_template_epic` | Hermes / Claude | `Ready` | Nenhum |
| [`01-fundacao-publicacao`](features/01-fundacao-publicacao/) | `04-pipeline-de-publicacao-e-verificacao` | Claude | `Done` | Nenhum |
| [`03-manual-do-metodo`](features/03-manual-do-metodo/) | `05-posicionamento-no-ecossistema` | Claude | `Done` | Nenhum |

*Legenda de Status: `Ready` (Pronto para iniciar) | `WIP` (Em andamento) | `Blocked` (Bloqueado) | `Done` (Concluído)*

---

## 🛑 Registro de Bloqueios Atuais (Blockers Log)

*Nenhum bloqueio registrado no momento.*

---

## 📝 Últimas Atualizações e Decisões

- **[Data Inicial]:** Inicialização do template base do repositório (Liquid v1).
- **2026-08-29:** Feature `03-manual-do-metodo` concluída, empilhada sobre `01-fundacao-publicacao`. Publica o glossário canônico da Linguagem Ubíqua do método (o único domínio conceitual real do produto além da própria fundação) e o manual completo — paradigma, ciclo de vida e papéis, anatomia do workspace e Algemas da IA, e posicionamento no ecossistema — em `apps/site/content/en/method/`. Desbloqueia as features `02`, `04`, `05` e `06`/épico `03`, que dependiam do glossário existir antes de publicar conteúdo (INV-03).

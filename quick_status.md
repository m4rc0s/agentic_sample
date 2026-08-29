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
| [`02-narrativa-de-entrada`](features/02-narrativa-de-entrada/) | `03-chamadas-para-acao-e-provas` | Claude | `Done` | Nenhum |
| [`03-manual-do-metodo`](features/03-manual-do-metodo/) | `05-posicionamento-no-ecossistema` | Claude | `Done` | Nenhum |
| [`04-guia-de-adocao`](features/04-guia-de-adocao/) | `03-referencia-de-scaffold-e-checklists` | Claude | `Done` | Nenhum |

*Legenda de Status: `Ready` (Pronto para iniciar) | `WIP` (Em andamento) | `Blocked` (Bloqueado) | `Done` (Concluído)*

---

## 🛑 Registro de Bloqueios Atuais (Blockers Log)

*Nenhum bloqueio registrado no momento.*

---

## 📝 Últimas Atualizações e Decisões

- **[Data Inicial]:** Inicialização do template base do repositório (Liquid v1).
- **2026-08-29:** Feature `03-manual-do-metodo` concluída, empilhada sobre `01-fundacao-publicacao`. Publica o glossário canônico da Linguagem Ubíqua do método (o único domínio conceitual real do produto além da própria fundação) e o manual completo — paradigma, ciclo de vida e papéis, anatomia do workspace e Algemas da IA, e posicionamento no ecossistema — em `apps/site/content/en/method/`. Desbloqueia as features `02`, `04`, `05` e `06`/épico `03`, que dependiam do glossário existir antes de publicar conteúdo (INV-03).
- **2026-08-29:** Feature `02-narrativa-de-entrada` concluída, empilhada sobre `03-manual-do-metodo`. Reescreve a home (`apps/site/content/en/_index.md`) por completo, substituindo a página de exemplo provisória da feature `01`: a tese de abertura do método, os três pilares (nomes exatos de `README.md:21-25`) e o ciclo de sete etapas (`README.md:130-138`), e duas chamadas para ação com destino real. As CTAs para as features `04` e `05`, que ainda não existem, foram deliberadamente omitidas — decisão do capitão registrada em `features/02-narrativa-de-entrada/index.md` §6.1 — em vez de apontar para um placeholder ou violar INV-02.
- **2026-08-29:** Feature `04-guia-de-adocao` concluída, a partir de `origin/main` (branch normal, sem empilhamento — a fundação e o glossário já estavam em `main`). Publica a nova seção `apps/site/content/en/guide/` com três páginas: quickstart do caminho feliz completo, prompt book com os seis prompts de `.agents/prompts_guide.md` reproduzidos verbatim (verificado caractere por caractere), e a referência dos três comandos de `scaffold.sh` — executados de verdade em cópia fora do repositório — mais os checklists de DoR e DoD. A nota sobre agentes suportados foi escrita a partir da leitura real de `AGENTS.md` e `CLAUDE.md` em `main`, não copiada de `README.md` §1. Os checkers de INV-01/INV-02 e o de vocabulário (INV-03.b) passam sobre o site com o novo conteúdo.

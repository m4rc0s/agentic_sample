# Quick Status: Feature 03-manual-do-metodo

> **Painel de Controle Local da Feature**
> **Status da Feature:** `Done` | **Última Atualização:** 2026-08-29

---

## 🚦 Status dos Épicos

| Épico | Responsável | Status | Progresso | Bloqueios |
| :--- | :--- | :--- | :--- | :--- |
| [`01-modelo-de-conteudo-e-linguagem-ubiqua`](epics/01-modelo-de-conteudo-e-linguagem-ubiqua/) | Claude | `Done` | 100% | Nenhum |
| [`02-paradigma-spec-como-software`](epics/02-paradigma-spec-como-software/) | Claude | `Done` | 100% | Nenhum |
| [`03-ciclo-de-vida-e-papeis`](epics/03-ciclo-de-vida-e-papeis/) | Claude | `Done` | 100% | Nenhum |
| [`04-anatomia-do-workspace-e-algemas`](epics/04-anatomia-do-workspace-e-algemas/) | Claude | `Done` | 100% | Nenhum |
| [`05-posicionamento-no-ecossistema`](epics/05-posicionamento-no-ecossistema/) | Claude | `Done` | 100% | Nenhum |

*Legenda de Status: `Ready` \| `WIP` \| `Blocked` \| `Done`*

---

## 🛑 Bloqueios e Impedimentos

*Nenhum bloqueio registrado.*

**Item herdado, não bloqueante:** a tensão de idioma entre o corpus de spec (português) e o site (inglês) permanece em aberto, como registrado em [`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md) §6.1. Esta feature não a resolve — a página do glossário publica a tradução com o termo original em português citado, mantendo todas as saídas possíveis abertas para o capitão.

---

## 📝 Diário de Bordo da Feature

- **2026-08-29:** Feature criada com `./scripts/scaffold.sh feature 03-manual-do-metodo`, empilhada sobre a branch `fm/site-fund-s1` (feature `01`, ainda não mesclada em `main`). O `_template_epic` órfão injetado pelo scaffold foi removido antes de criar os cinco épicos reais.
- **2026-08-29:** Escopo de negócio delimitado em `index.md`, sem menção a tecnologia, a partir do relatório de plano aprovado (`data/site-plan-s1/report.md`).
- **2026-08-29:** Épico `01` modelado com o **único domínio conceitual genuíno do produto além da feature `01`**: o glossário canônico da Linguagem Ubíqua do método Liquid — nove termos centrais e dez termos de apoio, cada um com definição extraída do corpus, sinônimos proibidos e fonte citável.
- **2026-08-29:** INV-03 (vocabulário único) e INV-04 (rastreabilidade) enunciadas como regras verificáveis, com a parte estruturalmente verificável coberta por um novo checker (`check_vocabulary.sh`) e a parte semântica registrada honestamente como exigência editorial, sem fabricar automação que não pode existir com dependência zero.
- **2026-08-29:** Épicos `02`–`05` modelados com **declaração explícita de ausência de domínio conceitual próprio**, cada um consumindo o glossário do épico `01` sem redefinir termo.
- **2026-08-29:** Cinco páginas publicadas em inglês em `apps/site/content/en/method/`: glossário, paradigma, ciclo de vida e papéis, anatomia do workspace e Algemas da IA, e posicionamento no ecossistema. Navegação primária atualizada com a entrada "The Method".
- **2026-08-29:** `check_vocabulary.sh` comprovado nas duas direções — passa no site íntegro, reprova com código de saída `1` diante de sinônimo proibido semeado, revertido sem resíduo.
- **2026-08-29:** Descoberto e corrigido durante a verificação: "monorepo" não podia ser um sinônimo proibido automatizável — o próprio corpus define `Workspace` por contraste com monorepos, então qualquer página fiel sobre o pilar de isolamento legitimamente usa a palavra. Removido da lista automatizada; mantido como exigência editorial no catálogo completo do `plan.md`.
- **2026-08-29:** `check_invariants.sh` (INV-01, INV-02, herdados da feature `01`) e `check_vocabulary.sh` (INV-03.b) rodados juntos sobre o site construído com as oito páginas totais (as três da feature `01` mais as cinco desta feature): ambos passam com código de saída `0`.
- **2026-08-29:** Renderização verificada visualmente em navegador, nos dois modos de exibição (claro e escuro): navegação, callout, tabelas e sumário de página funcionam corretamente.
- **2026-08-29:** Feature marcada `Done`. Features `02`, `04`, `05` e `06` permanecem fora do escopo deste trabalho, agora desbloqueadas pelo glossário canônico.

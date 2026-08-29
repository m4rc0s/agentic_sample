# Quick Status: Feature 02-narrativa-de-entrada

> **Painel de Controle Local da Feature**
> **Status da Feature:** `Done` | **Última Atualização:** 2026-08-29

---

## 🚦 Status dos Épicos

| Épico | Responsável | Status | Progresso | Bloqueios |
| :--- | :--- | :--- | :--- | :--- |
| [`01-tese-e-hero`](epics/01-tese-e-hero/) | Claude | `Done` | 100% | Nenhum |
| [`02-pilares-e-ciclo`](epics/02-pilares-e-ciclo/) | Claude | `Done` | 100% | Nenhum |
| [`03-chamadas-para-acao-e-provas`](epics/03-chamadas-para-acao-e-provas/) | Claude | `Done` | 100% | Nenhum |

*Legenda de Status: `Ready` \| `WIP` \| `Blocked` \| `Done`*

---

## 🛑 Bloqueios e Impedimentos

*Nenhum bloqueio registrado.*

**Item herdado, não bloqueante:** a tensão de idioma entre o corpus de spec (português) e o site (inglês) permanece em aberto, como registrado em [`../01-fundacao-publicacao/index.md`](../01-fundacao-publicacao/index.md) §6.1. Esta feature não a resolve.

---

## 📝 Diário de Bordo da Feature

- **2026-08-29:** Feature criada com `./scripts/scaffold.sh feature 02-narrativa-de-entrada`, empilhada sobre a branch `fm/site-feat03-s1` (features `01` e `03`, ambas já entregues nesta branch, ainda não mescladas em `main`). O `_template_epic` órfão injetado pelo scaffold foi removido antes de criar os três épicos reais.
- **2026-08-29:** Escopo de negócio delimitado em `index.md`, sem menção a tecnologia, a partir do relatório de plano aprovado (`data/site-plan-s1/report.md`, §3, Feature 02) e da leitura integral de `README.md` e do glossário publicado pela feature `03`.
- **2026-08-29:** Os três épicos modelados com **declaração explícita de ausência de domínio conceitual próprio** — todos consomem o glossário da feature `03`, épico `01`, sem redefinir termo. Mesmo padrão já adotado pelos épicos sem domínio das features `01` e `03`.
- **2026-08-29:** Decisão do capitão registrada em `index.md` §6.1: as CTAs para as features `04` e `05` (que não existem) são **omitidas** da home, com um callout "Open decisions" documentando a omissão — não um placeholder enganoso, não um link quebrado.
- **2026-08-29:** `apps/site/content/en/_index.md` reescrito por completo, substituindo a página de exemplo provisória da feature `01`: tese de abertura, os três pilares (nomes exatos de `README.md:21-25`, traduzidos com a fidelidade já estabelecida por `03/ecosystem-positioning.md`), o ciclo de sete etapas (`README.md:130-138`) como lista ordenada, e as duas CTAs com destino real.
- **2026-08-29:** `hugo --source apps/site` construído com sucesso (8 páginas). `check_invariants.sh` (INV-01, INV-02) e `check_vocabulary.sh` (INV-03.b) rodados sobre a saída construída: ambos passam com código de saída `0`.
- **2026-08-29:** Renderização verificada visualmente em navegador (`hugo server`, porta local dedicada para não colidir com outra sessão já usando a porta padrão): tese e lead compreensíveis sem rolagem em desktop; tabela de pilares, lista do ciclo, CTAs e callout renderizam corretamente em modo escuro; navegação para `/en/method/` e para o repositório externo confirmada.
- **2026-08-29:** Feature marcada `Done`. Features `04` e `05` permanecem fora do escopo deste trabalho, com a decisão de omissão de suas CTAs registrada e não silenciosa.

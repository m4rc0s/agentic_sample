# Quick Status: Feature 01-fundacao-publicacao

> **Painel de Controle Local da Feature**  
> **Status da Feature:** `Done` | **Última Atualização:** 2026-08-27

---

## 🚦 Status dos Épicos

| Épico | Responsável | Status | Progresso | Bloqueios |
| :--- | :--- | :--- | :--- | :--- |
| [`01-manifesto-e-scaffold-do-app`](epics/01-manifesto-e-scaffold-do-app/) | Claude | `Done` | 100% | Nenhum |
| [`02-sistema-visual-e-layout-base`](epics/02-sistema-visual-e-layout-base/) | Claude | `Done` | 100% | Nenhum |
| [`03-navegacao-e-rotas`](epics/03-navegacao-e-rotas/) | Claude | `Done` | 100% | Nenhum |
| [`04-pipeline-de-publicacao-e-verificacao`](epics/04-pipeline-de-publicacao-e-verificacao/) | Claude | `Done` | 100% | Nenhum |

*Legenda de Status: `Ready` \| `WIP` \| `Blocked` \| `Done`*

---

## 🛑 Bloqueios e Impedimentos

*Nenhum bloqueio registrado.*

**Item adiado, não bloqueante:** a entrega em produção depende da decisão de hospedagem, adiada pelo capitão ([`index.md`](index.md) §6.2). O site é construído e verificado a cada mudança; o ponto de entrega está documentado como gancho. Nenhuma feature seguinte fica bloqueada por isso.

---

## 📝 Diário de Bordo da Feature

- **2026-08-27:** Feature criada com `./scripts/scaffold.sh feature 01-fundacao-publicacao`. O `_template_epic` órfão injetado pelo scaffold foi removido; os quatro épicos reais foram criados com o mesmo script.
- **2026-08-27:** Escopo de negócio delimitado em `index.md`, sem menção a tecnologia, a partir do plano de features aprovado.
- **2026-08-27:** Épicos `01` e `02` modelados com **declaração explícita de ausência de domínio conceitual**, com justificativa — resultado legítimo da modelagem pela regra do [`team_playbook.md`](../../team_playbook.md) §4.1, e não fabricação de entidades para preencher o molde.
- **2026-08-27:** Épicos `03` e `04` modelados com INV-01 (âncora única) e INV-02 (integridade referencial) como invariantes de publicação verificáveis.
- **2026-08-27:** Aplicação `apps/site` implementada, construída de verdade e verificada. O checker foi comprovado nas duas direções: passa no site íntegro e reprova com código de saída diferente de zero em violação semeada de cada invariante.
- **2026-08-27:** Feature marcada `Done`. Conteúdo real de página permanece fora do escopo, com as features `02` e `03`.

# Quick Status: Feature 04-guia-de-adocao

> **Painel de Controle Local da Feature**
> **Status da Feature:** `Done` | **Última Atualização:** 2026-08-29

---

## 🚦 Status dos Épicos

| Épico | Responsável | Status | Progresso | Bloqueios |
| :--- | :--- | :--- | :--- | :--- |
| [`01-quickstart-do-zero-ao-primeiro-epico`](epics/01-quickstart-do-zero-ao-primeiro-epico/) | Claude | `Done` | 100% | Nenhum |
| [`02-prompt-book-publicado`](epics/02-prompt-book-publicado/) | Claude | `Done` | 100% | Nenhum |
| [`03-referencia-de-scaffold-e-checklists`](epics/03-referencia-de-scaffold-e-checklists/) | Claude | `Done` | 100% | Nenhum |

*Legenda de Status: `Ready` \| `WIP` \| `Blocked` \| `Done`*

---

## 🛑 Bloqueios e Impedimentos

*Nenhum bloqueio registrado.*

---

## 📝 Diário de Bordo da Feature

- **2026-08-29:** Feature criada com `./scripts/scaffold.sh feature 04-guia-de-adocao`, a partir de `origin/main`. O `_template_epic` órfão injetado pelo scaffold foi removido; os três épicos reais foram criados com o mesmo script.
- **2026-08-29:** Escopo de negócio delimitado em `index.md`, sem menção a tecnologia, a partir da §Feature 04 do relatório de plano de features aprovado.
- **2026-08-29:** Os três épicos modelados com **declaração explícita de ausência de domínio conceitual**, com justificativa — resultado legítimo da modelagem pela regra do [`team_playbook.md`](../../team_playbook.md) §4.1, e não fabricação de entidades para preencher o molde.
- **2026-08-29:** `AGENTS.md` e `CLAUDE.md` lidos como existem hoje em `main` para escrever a nota honesta sobre agentes suportados, exigida pelo plano aprovado — não copiada de `README.md` §1 sem checar.
- **2026-08-29:** Os três comandos de `scripts/scaffold.sh` executados de verdade numa cópia fora do repositório, com saída de console e árvore de arquivos capturadas antes da publicação da referência.
- **2026-08-29:** Os seis prompts de `.agents/prompts_guide.md` publicados e verificados caractere por caractere contra o original — identidade confirmada (INV-05).
- **2026-08-29:** Três páginas publicadas em `apps/site/content/en/guide/` (quickstart, prompt-book, reference), com entrada de menu `Guide` adicionada a `apps/site/hugo.toml`.
- **2026-08-29:** Site construído (`hugo --source apps/site`) com código de saída 0; `check_invariants.sh` (INV-01/INV-02) e `check_vocabulary.sh` (INV-03.b) passando sobre o site completo, 12 páginas examinadas.
- **2026-08-29:** Feature marcada `Done`. A trilha de prova viva permanece fora do escopo, com a feature `05`.

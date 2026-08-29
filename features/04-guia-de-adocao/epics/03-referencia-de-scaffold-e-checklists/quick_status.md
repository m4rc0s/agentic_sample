# Quick Status: Épico 03-referencia-de-scaffold-e-checklists

> **Rastro Local de Auditoria e Status de Execução do Épico**
> **Status:** `Done` | **Progresso:** 100% (7/7 Tarefas) | **Última Atualização:** 2026-08-29

---

## 📊 Progresso de Tarefas

- [x] **Fase 1: Execução Real dos Comandos:** `2/2`
- [x] **Fase 2: Criação da Página:** `1/1`
- [x] **Fase 3: Verificação da Entrega:** `2/2`
- [x] **Fase 4: Fechamento e Auditoria:** `2/2`

*O molde previa fases voltadas a domínio, casos de uso e adapters. Este épico não tem domínio (ver [`plan.md`](plan.md) §1); as fases foram substituídas pelas que correspondem ao trabalho real.*

---

## 🛑 Bloqueios Atuais

*Nenhum bloqueio identificado.*

---

## 📝 Diário de Execução e Auditoria do Agente

- **2026-08-29:** Épico criado com `./scripts/scaffold.sh epic 04-guia-de-adocao 03-referencia-de-scaffold-e-checklists`.
- **2026-08-29:** `plan.md` modelado com **declaração explícita de ausência de domínio conceitual** e justificativa, incluindo o registro de onde e por que os comandos foram executados fora deste repositório.
- **2026-08-29:** Os três comandos de `scripts/scaffold.sh` (`feature`, `epic`, `app`) executados de verdade numa cópia em `/tmp` fora da árvore de trabalho; saída de console e árvore de arquivos capturadas integralmente.
- **2026-08-29:** `apps/site/content/en/guide/reference.md` publicada com os três comandos, a saída real, e os checklists de DoR e DoD conferidos contra `team_playbook.md` §3–4.
- **2026-08-29:** Site construído e verificado: `hugo --source apps/site` com código de saída 0; `check_invariants.sh` e `check_vocabulary.sh` passando sobre o site completo da feature `04`.
- **2026-08-29:** Épico concluído pelos três cenários verificáveis do [`index.md`](index.md) §3. Feature `04-guia-de-adocao` concluída.

# Quick Status: Épico 02-prompt-book-publicado

> **Rastro Local de Auditoria e Status de Execução do Épico**
> **Status:** `Done` | **Progresso:** 100% (6/6 Tarefas) | **Última Atualização:** 2026-08-29

---

## 📊 Progresso de Tarefas

- [x] **Fase 1: Extração Fiel:** `1/1`
- [x] **Fase 2: Criação da Página:** `1/1`
- [x] **Fase 3: Verificação de Fidelidade e da Entrega:** `2/2`
- [x] **Fase 4: Fechamento e Auditoria:** `2/2`

*O molde previa fases voltadas a domínio, casos de uso e adapters. Este épico não tem domínio (ver [`plan.md`](plan.md) §1); as fases foram substituídas pelas que correspondem ao trabalho real.*

---

## 🛑 Bloqueios Atuais

*Nenhum bloqueio identificado.*

---

## 📝 Diário de Execução e Auditoria do Agente

- **2026-08-29:** Épico criado com `./scripts/scaffold.sh epic 04-guia-de-adocao 02-prompt-book-publicado`.
- **2026-08-29:** `plan.md` modelado com **declaração explícita de ausência de domínio conceitual**, justificativa, e o registro da tensão de idioma que este épico herda sem resolver.
- **2026-08-29:** Os seis prompts de `.agents/prompts_guide.md` extraídos e comparados caractere por caractere contra a página publicada — nenhuma divergência.
- **2026-08-29:** `apps/site/content/en/guide/prompt-book.md` publicada com as seis etapas, corpo dos prompts em português verbatim, apresentação em inglês.
- **2026-08-29:** Site construído e verificado: `hugo --source apps/site` com código de saída 0; `check_invariants.sh` e `check_vocabulary.sh` passando sobre o site com o novo conteúdo.
- **2026-08-29:** Épico concluído pelos três cenários verificáveis do [`index.md`](index.md) §3, com prova de fidelidade de reprodução (INV-05).

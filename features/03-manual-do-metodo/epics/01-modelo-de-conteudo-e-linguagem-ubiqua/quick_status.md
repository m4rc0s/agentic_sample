# Quick Status: Épico 01-modelo-de-conteudo-e-linguagem-ubiqua

> **Rastro Local de Auditoria e Status de Execução do Épico**
> **Status:** `Done` | **Progresso:** 100% (9/9 Tarefas) | **Última Atualização:** 2026-08-29

---

## 📊 Progresso de Tarefas

- [x] **Fase 1: Checker de INV-03.b (Vocabulário):** `3/3`
- [x] **Fase 2: Página do Glossário (INV-04):** `3/3`
- [x] **Fase 3: Verificação de Ponta a Ponta:** `3/3`

---

## 🛑 Bloqueios Atuais

*Nenhum bloqueio identificado.*

---

## 📝 Diário de Execução e Auditoria do Agente

- **2026-08-29:** Épico criado com `./scripts/scaffold.sh epic 03-manual-do-metodo 01-modelo-de-conteudo-e-linguagem-ubiqua`.
- **2026-08-29:** `plan.md` modelado como o único domínio conceitual real do produto além da feature `01`: nove termos centrais e dez termos de apoio da Linguagem Ubíqua do método Liquid, cada um com definição extraída do corpus, sinônimos proibidos e fonte citável — nenhuma definição inventada.
- **2026-08-29:** INV-03 (vocabulário único) e INV-04 (rastreabilidade) enunciadas como regras verificáveis, decompostas em uma condição estruturalmente verificável e uma condição editorial cada, com a limitação honestamente registrada: um checker Bash de dependência zero não pode julgar semântica de uso, só ausência textual de frase.
- **2026-08-29:** `check_vocabulary.sh` entregue e comprovado nas duas direções — passa no site íntegro, reprova com código de saída `1` diante de sinônimo proibido semeado, identificando frase e página.
- **2026-08-29:** A lista de sinônimos automatizáveis (`forbidden_synonyms.tsv`) foi deliberadamente restrita a um subconjunto seguro do catálogo completo do `plan.md`, para não produzir falsa reprovação sobre palavras com uso legítimo independente em outras partes do site (ex.: "feature", "task", "README", "user story" já são vocabulário aprovado em outro contexto).
- **2026-08-29:** Página do glossário publicada em `apps/site/content/en/method/glossary.md`, em inglês, com o termo original em português citado por entrada — cumprindo a decisão do capitão em [`../../../01-fundacao-publicacao/index.md`](../../../01-fundacao-publicacao/index.md) §6.1.
- **2026-08-29:** A página do glossário foi exempta do checker de INV-03.b, por documentar os sinônimos proibidos por definição — mesma lógica do carve-out de redirect stub já usado por INV-01.
- **2026-08-29:** `check_invariants.sh` (INV-01, INV-02) e `check_vocabulary.sh` (INV-03.b) rodados juntos sobre a saída construída com a nova seção `method/`: ambos passam com código de saída `0`.
- **2026-08-29:** Épico concluído.

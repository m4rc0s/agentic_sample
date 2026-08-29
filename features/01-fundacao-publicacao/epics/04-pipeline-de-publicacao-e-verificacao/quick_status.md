# Quick Status: Épico 04-pipeline-de-publicacao-e-verificacao

> **Rastro Local de Auditoria e Status de Execução do Épico**  
> **Status:** `Done` | **Progresso:** 100% (14/14 Tarefas) | **Última Atualização:** 2026-08-27

---

## 📊 Progresso de Tarefas

- [x] **Fase 1: Checker de Invariantes:** `6/6`
- [x] **Fase 2: Prova de que o Checker Reprova:** `2/2`
- [x] **Fase 3: Integração Contínua:** `3/3`
- [x] **Fase 4: Pré-visualização e Fechamento:** `3/3`

---

## 🛑 Bloqueios Atuais

*Nenhum bloqueio identificado.*

**Item adiado, não bloqueante:** a entrega ao provedor de hospedagem depende de decisão adiada pelo capitão ([`../../index.md`](../../index.md) §6.2). O processo constrói, verifica e guarda o resultado como artefato; o gancho de entrega está documentado no workflow e no `README.md` da aplicação. Nenhum provedor foi configurado.

---

## 📝 Diário de Execução e Auditoria do Agente

- **2026-08-27:** Épico criado com `./scripts/scaffold.sh epic 01-fundacao-publicacao 04-pipeline-de-publicacao-e-verificacao`.
- **2026-08-27:** `plan.md` modelado com INV-01 (herdada do épico `03`) e **INV-02 (integridade referencial)**, enunciadas como regras verificáveis. Acrescentado o value object `Referência` e a **condição de honestidade do verificador**: quem não consegue verificar reprova, nunca aprova.
- **2026-08-27:** Checker entregue em Bash com utilitários POSIX e **dependência zero**, coerente com a homologação de stack: adotar um gerador de binário único e depois trazer um runtime de testes com gerenciador de pacotes anularia o isolamento que motivou a escolha.
- **2026-08-27:** **Checker provado nas duas direções.** Aprova o site íntegro com código 0 e reprova com código diferente de zero nas violações semeadas de INV-01 e de INV-02. Um checker que nunca reprovou não é um checker; este reprovou.
- **2026-08-27:** Integração contínua construindo e verificando a cada mudança, com a versão do Hugo fixada. **Nenhuma entrega para provedor configurada** — o gancho ficou documentado.
- **2026-08-27:** **Correção encontrada pela própria integração contínua.** O CI constrói com minificação, e HTML minificado não usa aspas em atributos (`rel=canonical href=/en/`). O checker casava apenas a forma com aspas e, portanto, não enxergava o artefato que de fato é entregue. Ele **reprovou com código 2** em vez de aprovar às cegas — exatamente o comportamento exigido pela condição de honestidade do verificador ([`plan.md`](plan.md) §2). Corrigido normalizando os atributos por tag, de modo que o checker leia as duas formas. Reprovado o impulso de tirar a minificação do CI: o checker deve verificar o que é publicado, não uma variante conveniente dele.
- **2026-08-27:** Suíte de prova re-executada nos **dois modos de construção**, minificado e não minificado, com resultados idênticos: aprova o site íntegro (0), reprova as violações semeadas de INV-01 e INV-02 (1) e reprova as três condições de impossibilidade de verificar (2).
- **2026-08-27:** Épico concluído. Com ele, a feature `01` fecha e as features de conteúdo ficam desbloqueadas.

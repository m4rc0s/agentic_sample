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
- **2026-08-27:** Épico concluído. Com ele, a feature `01` fecha e as features de conteúdo ficam desbloqueadas.

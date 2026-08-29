# Quick Status: Épico 03-navegacao-e-rotas

> **Rastro Local de Auditoria e Status de Execução do Épico**  
> **Status:** `Done` | **Progresso:** 100% (11/11 Tarefas) | **Última Atualização:** 2026-08-27

---

## 📊 Progresso de Tarefas

- [x] **Fase 1: Roteamento com Prefixo de Idioma:** `3/3`
- [x] **Fase 2: Metadados por Página (INV-01):** `3/3`
- [x] **Fase 3: Navegação e Sumário:** `2/2`
- [x] **Fase 4: Fechamento e Auditoria:** `3/3`

---

## 🛑 Bloqueios Atuais

*Nenhum bloqueio identificado.*

---

## 📝 Diário de Execução e Auditoria do Agente

- **2026-08-27:** Épico criado com `./scripts/scaffold.sh epic 01-fundacao-publicacao 03-navegacao-e-rotas`.
- **2026-08-27:** `plan.md` modelado. Este é o primeiro épico da feature com modelagem conceitual real: um value object legítimo (`ÂncoraCanônica`) e a invariante de publicação **INV-01 (âncora única)**, enunciada como regra verificável. Sem entidade, sem evento e sem caso de uso — nenhum dos três existe aqui, e nenhum foi fabricado.
- **2026-08-27:** Prefixo de idioma aplicado a **todas** as rotas desde a primeira publicação, com um só idioma ativo. Custo baixo agora; retrabalho de roteamento evitado se o corpus vier a ser bilíngue (decisão em aberto, [`../../index.md`](../../index.md) §6.1).
- **2026-08-27:** `baseURL` mantido parametrizável com valor neutro por padrão, para não gravar no repositório uma decisão de hospedagem que o capitão adiou.
- **2026-08-27:** Âncora canônica derivada da rota, uniformemente, em vez de declarada à mão — o que faz INV-01.a valer por construção e torna INV-01.b barata de verificar.
- **2026-08-27:** INV-01 conferida na saída construída. A automação dessa conferência foi entregue no épico `04`.
- **2026-08-27:** Épico concluído.

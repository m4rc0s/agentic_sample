# Tactical Roadmap: 03-navegacao-e-rotas

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Rotas com Prefixo de Idioma ] ──► [ Ciclo 2: Metadados, Âncora Canônica & Navegação ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Roteamento:** prefixo de idioma em todas as rotas desde a primeira publicação, com a raiz conduzindo ao idioma padrão e o endereço base parametrizável.
2. **Pacote 2 — Metadados e INV-01:** título, descrição, idioma e **exatamente uma** âncora canônica por página, derivada da rota de forma uniforme.
3. **Pacote 3 — Navegação:** navegação primária estável em toda página e sumário derivado dos títulos do conteúdo.

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** O prefixo de idioma vale a pena mesmo com um único idioma ativo. Sustentada pela decisão ainda em aberto sobre o idioma do corpus de spec ([`../../index.md`](../../index.md) §6.1): das três saídas possíveis, duas exigem mais de um idioma, e nenhuma delas custa retrabalho de roteamento por causa desta escolha.
* **Suposição 2:** A âncora canônica derivada da rota é suficiente enquanto não houver conteúdo alcançável por mais de um caminho. Se uma feature de conteúdo introduzir agregações que exponham o mesmo material em dois lugares, INV-01 passa a exigir declaração explícita ali — e a violação será detectada pelo checker antes de chegar ao público.
* **Risco 1:** Gravar um endereço de provedor no repositório e, com isso, tomar por conta própria uma decisão que é do capitão. **Mitigação:** valor neutro por padrão e endereço injetado no momento da construção.
* **Risco 2:** INV-01 ficar enunciada mas não verificada, o que não satisfaria o critério de conclusão de [`team_playbook.md`](../../../../team_playbook.md) §4.1. **Mitigação:** a verificação automatizada é entrega obrigatória do épico `04`, e o épico `03` não é fechado sem ela.

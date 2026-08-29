# Tactical Roadmap: 03-chamadas-para-acao-e-provas

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: CTAs Reais ] ──► [ Ciclo 2: Tratamento de 04/05 ] ──► [ Ciclo 3: Verificação ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — CTAs com destino real:** "Understand the method" e "See the repository", ambas resolvendo para páginas ou endereços existentes.
2. **Pacote 2 — Tratamento honesto de `04`/`05`:** callout "Open decisions" documentando a omissão deliberada, sem placeholder e sem link quebrado.
3. **Pacote 3 — Verificação:** INV-01, INV-02, INV-03.b passando; verificação negativa explícita de que nenhuma menção a `04`/`05` sobrevive na página construída.

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** A decisão do capitão de omitir as CTAs para `04`/`05` (registrada em `../../index.md` §6.1) já resolve este épico sem precisar de nova deliberação. Confirmada — este `plan.md` apenas executa a decisão.
* **Risco 1 (o mais alto deste épico):** Escrever o callout "Open decisions" de um jeito que, sem querer, viole INV-02 — por exemplo, citando o caminho literal `features/04-guia-de-adocao/index.md`, que o checker trataria como referência a um documento inexistente. **Mitigação:** o callout menciona as features `04` e `05` apenas por número, nunca por caminho de arquivo; Task 3.2 roda uma verificação negativa explícita com `grep` antes de considerar o épico concluído.
* **Risco 2:** A CTA "ver o repositório" duplicar, de forma divergente, o link já existente no rodapé global (`layouts/_partials/footer.html`), com URL diferente por erro de digitação. **Mitigação:** o link usa o mesmo endereço já configurado em `hugo.toml` `params.repository`, copiado, não redigitado de memória.

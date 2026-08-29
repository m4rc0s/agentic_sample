# Tactical Roadmap: 02-sistema-visual-e-layout-base

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Escalas, Paleta & Modos ] ──► [ Ciclo 2: Layout Base, Componentes & Verificação de Acessibilidade ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Sistema visual:** escala tipográfica, escala de espaçamento, paleta e os dois modos de exibição, com alternador que não depende de biblioteca externa.
2. **Pacote 2 — Layout base:** o envelope semântico herdado por toda página, com cabeçalho, rodapé e atalho para o conteúdo principal.
3. **Pacote 3 — Componentes de conteúdo:** bloco de código, tabela, destaque e figura — o conjunto mínimo que o material das features de conteúdo vai exigir.
4. **Pacote 4 — Verificação de acessibilidade:** contraste medido nos dois modos e operação integral por teclado.

*Os pacotes do molde — núcleo de domínio, casos de uso, endpoints — não se aplicam: ver [`plan.md`](plan.md) §1.*

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** O conjunto mínimo de componentes cobre o material previsto para as features de conteúdo. Se uma delas exigir um componente novo, ele nasce lá, com sua própria justificativa — não é antecipado aqui.
* **Risco 1:** Sistema visual crescer por especulação, entregando componentes que nenhum conteúdo consome. **Mitigação:** cada elemento precisa apontar a feature de conteúdo que o exigirá; sem isso, fica fora.
* **Risco 2:** Acessibilidade tratada como ajuste posterior. **Mitigação:** contraste e operação por teclado são cenários de aceitação do próprio épico, não item de revisão futura.
* **Risco 3:** Dependência externa entrar por conveniência — uma fonte, um ícone, uma folha de estilo de CDN — e furar o isolamento que sustenta a escolha da stack em [`technical_agreement.md`](../../../../technical_agreement.md). **Mitigação:** ausência de origem externa é restrição verificável (Q-04) na saída construída.

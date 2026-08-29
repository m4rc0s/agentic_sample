# Tactical Roadmap: 02-pilares-e-ciclo

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Três Pilares ] ──► [ Ciclo 2: Sete Etapas ] ──► [ Ciclo 3: Verificação ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Tabela dos três pilares:** nomes exatos de `README.md:21-25`, traduzidos com a fidelidade já fixada por `03/ecosystem-positioning.md`.
2. **Pacote 2 — Lista das sete etapas do ciclo:** reprodução fiel do fluxograma de `README.md:130-138`.
3. **Pacote 3 — Verificação:** INV-01, INV-02, INV-03.b passando; confirmação de que nenhum componente visual novo foi introduzido.

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** As traduções dos três pilares já fixadas por `03/ecosystem-positioning.md` bastam sem ajuste. Confirmada durante a escrita — reutilizadas verbatim.
* **Risco 1:** Confundir as sete etapas de `README.md` com as seis de `index.md` (já reproduzidas por `03/lifecycle-and-roles.md`), produzindo uma terceira versão divergente do mesmo processo. **Mitigação:** `plan.md` §1.3 documenta explicitamente por que este épico reproduz a fonte de sete etapas, não a de seis, e confirma que as duas não se contradizem.
* **Risco 2:** A tentação de modelar o "ciclo" como uma máquina de estados ou uma sequência de Eventos de Domínio, fabricando domínio onde não existe. **Mitigação:** `plan.md` §1.2 examina e descarta essa hipótese explicitamente.
* **Risco 3:** Introduzir um componente visual novo (por exemplo, um diagrama customizado) para tornar o ciclo mais "visual". **Mitigação:** fora de escopo por instrução explícita do briefing; a lista ordenada e a tabela, componentes já existentes, cumprem o requisito de escaneabilidade sem novo código de layout.

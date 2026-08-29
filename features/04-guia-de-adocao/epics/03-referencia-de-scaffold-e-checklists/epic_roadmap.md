# Tactical Roadmap: 03-referencia-de-scaffold-e-checklists

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Execução Real em Cópia Descartável ] ──► [ Ciclo 2: Página de Referência ] ──► [ Ciclo 3: Conferência de Checklists ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Execução real:** os três comandos de `scaffold.sh` rodados de verdade fora do repositório, com saída de console e árvore de arquivos capturadas.
2. **Pacote 2 — Página publicada:** `apps/site/content/en/guide/reference.md`, com a referência dos três comandos e os checklists de DoR e DoD.
3. **Pacote 3 — Conferência:** cada item de checklist comparado contra `team_playbook.md` §3–4, e o site completo verificado pelos dois checkers.

*O molde previa pacotes de núcleo de domínio, casos de uso e endpoints. Este épico não tem domínio, caso de uso nem endpoint — ver [`plan.md`](plan.md) §1. Os pacotes acima descrevem a entrega real.*

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** `scripts/scaffold.sh` permanece com o comportamento observado nesta execução. Se o script mudar depois, a referência publicada desatualiza e precisa de nova execução — não de edição por suposição.
* **Risco 1:** Publicar saída de comando reconstruída de memória em vez de capturada de uma execução real. **Mitigação:** os três comandos foram executados de fato numa cópia descartável antes da redação da página (Task 1.1), seguindo o mesmo procedimento já registrado pela feature `01` para o Hugo.
* **Risco 2:** Poluir este repositório de trabalho com features e aplicações fictícias geradas para fins de documentação. **Mitigação:** toda execução aconteceu fora desta árvore, em `/tmp`, sem tocar `features/` ou `apps/` reais deste repositório.

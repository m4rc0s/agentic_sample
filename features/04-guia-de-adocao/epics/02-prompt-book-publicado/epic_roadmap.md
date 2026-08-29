# Tactical Roadmap: 02-prompt-book-publicado

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Extração Fiel dos Prompts ] ──► [ Ciclo 2: Página Publicada ] ──► [ Ciclo 3: Prova de Fidelidade ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Extração fiel:** os seis blocos de prompt copiados sem edição de `.agents/prompts_guide.md`.
2. **Pacote 2 — Página publicada:** `apps/site/content/en/guide/prompt-book.md`, com apresentação em inglês e corpo de prompt em português.
3. **Pacote 3 — Prova de fidelidade:** conferência caractere por caractere de cada prompt publicado contra o original, e verificação do site completo.

*O molde previa pacotes de núcleo de domínio, casos de uso e endpoints. Este épico não tem domínio, caso de uso nem endpoint — ver [`plan.md`](plan.md) §1. Os pacotes acima descrevem a entrega real.*

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** `.agents/prompts_guide.md` permanece estável pelo tempo desta entrega. Se o arquivo de origem mudar depois, a página publicada desatualiza e precisa de nova sincronização — não de reescrita por suposição.
* **Risco 1:** Parafrasear um prompt "para melhorar a clareza" e violar INV-05 sem perceber. **Mitigação:** o critério de conclusão exige identidade caractere por caractere, verificada explicitamente antes do fechamento (Task 3.1).
* **Risco 2:** Traduzir o corpo do prompt para inglês por consistência de idioma com o resto do site, quebrando a prova viva. **Mitigação:** a decisão de manter o corpo do prompt em português está registrada e justificada em [`plan.md`](plan.md) §1.2, não é um esquecimento.

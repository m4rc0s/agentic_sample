# Tactical Roadmap: 01-tese-e-hero

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Tese e Hero ] ──► [ Ciclo 2: Verificação ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Título e parágrafo de abertura:** a tese de que a IA automatizou a escrita de sintaxe, não a arquitetura, compreensível sem rolagem.
2. **Pacote 2 — Verificação:** INV-01, INV-02, INV-03.b passando, mais confirmação visual de que a primeira dobra não exige rolagem em desktop.

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** A frase de abertura já cunhada em `03/paradigm.md` é reaproveitável verbatim como título da home, sem precisar de nova tradução. Confirmada durante a escrita.
* **Risco 1:** Reformular a tese ao adaptá-la para o formato de título, introduzindo uma segunda versão da mesma ideia com palavras diferentes — o que violaria INV-05 (autoconsistência) mesmo sem violar INV-03. **Mitigação:** o título reproduz a frase de `03/paradigm.md` quase literalmente, sem parafrasear o argumento central.
* **Risco 2:** Um título longo poderia exigir rolagem em telas pequenas. **Mitigação:** verificação visual em janela desktop confirmou legibilidade sem rolagem; a tipografia responsiva (`--text-2xl`, `text-wrap: balance`) já herdada da feature `01` absorve a quebra de linha sem componente novo.

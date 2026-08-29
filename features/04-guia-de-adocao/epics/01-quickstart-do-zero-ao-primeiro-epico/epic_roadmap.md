# Tactical Roadmap: 01-quickstart-do-zero-ao-primeiro-epico

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Verificação da Fonte ] ──► [ Ciclo 2: Página do Quickstart ] ──► [ Ciclo 3: Verificação da Entrega ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Verificação:** o estado real de `AGENTS.md` e `CLAUDE.md` confirmado, e os quatro comandos do quickstart conferidos contra `README.md`.
2. **Pacote 2 — Página publicada:** `apps/site/content/en/guide/quickstart.md`, com a seção `guide` e sua entrada de menu.
3. **Pacote 3 — Verificação da entrega:** site construído e verificado pelos dois checkers de invariante.

*O molde previa pacotes de núcleo de domínio, casos de uso e endpoints. Este épico não tem domínio, caso de uso nem endpoint — ver [`plan.md`](plan.md) §1. Os pacotes acima descrevem a entrega real.*

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** `AGENTS.md` e `CLAUDE.md`, como existem hoje em `main`, permanecem estáveis pelo tempo desta entrega — se mudarem depois, a nota sobre agentes suportados desatualiza e precisa de nova verificação, não de reescrita por suposição.
* **Risco 1:** Publicar um comando desatualizado ou aproximado de `README.md`. **Mitigação:** cada comando citado foi conferido contra o arquivo de origem antes da publicação (Task 1.2).
* **Risco 2:** A nota sobre agentes suportados repetir, sem checar, a lista aspiracional de `README.md` §1. **Mitigação:** a nota foi escrita depois de ler `AGENTS.md` e `CLAUDE.md` como existem hoje, não copiada de memória (Task 1.1).

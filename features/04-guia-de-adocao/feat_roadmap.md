# Feature Roadmap: 04-guia-de-adocao

> **Marcos e Passos Específicos para Entrega Completa da Feature**

---

## 🗺️ Ordem Sequencial de Execução dos Épicos

```text
[ Épico 01: Quickstart ] ──► [ Épico 02: Prompt Book ] ──► [ Épico 03: Scaffold & Checklists ]
```

A ordem é branda, não rígida: os três épicos publicam páginas independentes que não dependem de conteúdo umas das outras para existir. A ordem escolhida segue a jornada real do adotante — primeiro o caminho feliz completo (`01`), depois os prompts que o caminho feliz usa em cada etapa (`02`), por fim a referência de comandos e checklists a que o adotante volta depois de já ter começado (`03`).

---

## 🚩 Marcos da Feature (Milestones)

### Marco 1 — O caminho feliz existe
* **Épicos:** [`epics/01-quickstart-do-zero-ao-primeiro-epico/`](epics/01-quickstart-do-zero-ao-primeiro-epico/)
* **Status:** `[Done]`
* **Critério de Conclusão:** A página de quickstart publica os quatro passos — criar o workspace, inicializar o contexto base, subir a sessão do agente, chegar ao primeiro `plan.md` aprovado — com os comandos reais de `README.md` e a nota honesta sobre agentes suportados.

---

### Marco 2 — Os prompts são copiáveis e fiéis
* **Épicos:** [`epics/02-prompt-book-publicado/`](epics/02-prompt-book-publicado/)
* **Status:** `[Done]`
* **Critério de Conclusão:** Os seis prompts de `.agents/prompts_guide.md` estão publicados em blocos de código copiáveis, verificados palavra por palavra contra o arquivo de origem.

---

### Marco 3 — Comandos executados e checklists publicados
* **Épicos:** [`epics/03-referencia-de-scaffold-e-checklists/`](epics/03-referencia-de-scaffold-e-checklists/)
* **Status:** `[Done]`
* **Critério de Conclusão:** Os três comandos de `scaffold.sh` foram executados de verdade em cópia fora do repositório, com a saída real documentada; os checklists de DoR e DoD de `team_playbook.md` §3–4 estão publicados sem paráfrase que altere o sentido.

---

## 🧭 Fronteira Desta Feature

O que vem **antes** dela e é pré-requisito: o glossário canônico da feature `03`/épico `01` (vocabulário) e o pipeline de publicação da feature `01` (capacidade de publicar). O que fica **fora** dela: instalação de agente específico, suporte, e a trilha de prova viva — que é a feature `05`, ainda não iniciada.

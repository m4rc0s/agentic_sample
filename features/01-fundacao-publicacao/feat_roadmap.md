# Feature Roadmap: 01-fundacao-publicacao

> **Marcos e Passos Específicos para Entrega Completa da Feature**

---

## 🗺️ Ordem Sequencial de Execução dos Épicos

```text
[ Épico 01: Manifesto & Scaffold ] ──► [ Épico 02: Sistema Visual & Layout ]
                                              │
                                              ▼
[ Épico 04: Pipeline & Verificação ] ◄── [ Épico 03: Navegação & Rotas ]
```

A ordem é rígida e cada passo depende do anterior por um motivo concreto:

* `02` depende de `01` porque não há onde aplicar layout antes de existir algo que compile e sirva páginas.
* `03` depende de `02` porque a navegação primária é um componente do layout base, e o endereço canônico precisa de uma página renderizada onde ser declarado.
* `04` depende de `03` porque o verificador de INV-01 e INV-02 opera sobre a saída construída: sem rotas e sem canônicos declarados, não há o que verificar.

---

## 🚩 Marcos da Feature (Milestones)

### Marco 1 — A aplicação existe e compila
* **Épicos:** [`epics/01-manifesto-e-scaffold-do-app/`](epics/01-manifesto-e-scaffold-do-app/)
* **Status:** `[Done]`
* **Critério de Conclusão:** O manifesto da aplicação está integralmente preenchido e declara a mesma stack homologada nos acordos técnicos; a aplicação compila sem erro e produz uma saída servível; nenhum artefato de construção entra no controle de versão.

---

### Marco 2 — Toda página tem forma
* **Épicos:** [`epics/02-sistema-visual-e-layout-base/`](epics/02-sistema-visual-e-layout-base/)
* **Status:** `[Done]`
* **Critério de Conclusão:** Existe um layout base compartilhado por toda página, com marcos semânticos, sistema visual mínimo, modo claro e escuro, e os quatro componentes de conteúdo. Contraste, foco visível e navegação por teclado verificados nos dois modos.

---

### Marco 3 — Toda página tem endereço único
* **Épicos:** [`epics/03-navegacao-e-rotas/`](epics/03-navegacao-e-rotas/)
* **Status:** `[Done]`
* **Critério de Conclusão:** Toda rota nasce sob prefixo de idioma, declara exatamente um endereço canônico, e declara título, descrição e idioma corretos. INV-01 é enunciada como invariante verificável.

---

### Marco 4 — Publicar é um caminho verificado
* **Épicos:** [`epics/04-pipeline-de-publicacao-e-verificacao/`](epics/04-pipeline-de-publicacao-e-verificacao/)
* **Status:** `[Done]`
* **Critério de Conclusão:** O verificador de INV-01 e INV-02 roda na integração contínua, passa no site íntegro e **reprova com código de saída diferente de zero** diante de violação semeada de cada invariante. O comando de pré-visualização local está documentado. O ponto de entrega ao provedor está documentado como gancho, sem provedor configurado.

---

## 🧭 Fronteira Desta Feature

O que vem **depois** dela e não pertence a ela: todo conteúdo real de página. A home é a feature `02`; o manual do método é a feature `03`. A página de exemplo entregue aqui é provisória por construção e existe apenas para provar que o caminho de publicação funciona ponta a ponta.

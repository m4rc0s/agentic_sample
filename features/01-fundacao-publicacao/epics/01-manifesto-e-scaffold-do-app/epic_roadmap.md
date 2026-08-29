# Tactical Roadmap: 01-manifesto-e-scaffold-do-app

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Registro & Homologação de Stack ] ──► [ Ciclo 2: Esqueleto que Constrói & Prova de Isolamento ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Registro da aplicação:** stack real homologada nos acordos técnicos e manifesto `app_liquid.md` integralmente preenchido, com a stack declarada idêntica à homologada.
2. **Pacote 2 — Isolamento da camada consequencial:** saídas de construção excluídas do controle de versão, tornando efetivo o princípio de que o código é consequencial e descartável.
3. **Pacote 3 — Esqueleto que constrói:** configuração e unidade mínima de conteúdo suficientes para que a construção termine com sucesso e produza saída servível.

*O molde previa pacotes de núcleo de domínio, casos de uso e endpoints. Este épico não tem domínio, caso de uso nem endpoint — ver [`plan.md`](plan.md) §1. Os pacotes acima descrevem a entrega real.*

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** A ferramenta de construção homologada em [`technical_agreement.md`](../../../../technical_agreement.md) permanece disponível como binário único, sem exigir gerenciador de pacotes — premissa que sustenta tanto a escolha do gerador quanto a do checker com dependência zero.
* **Suposição 2:** Nenhuma decisão de hospedagem é necessária para concluir este épico. Confirmada: a entrega vai até a saída construída e verificada, e para aí.
* **Risco 1:** Divergência silenciosa entre a stack declarada no manifesto e a homologada nos acordos técnicos. **Mitigação:** a identidade entre as duas é critério de aceitação explícito da feature e cenário verificável do [`index.md`](index.md) §3.
* **Risco 2:** A saída de construção ser commitada por engano, contradizendo na prática o princípio que o produto divulga. **Mitigação:** exclusão registrada no controle de versão e verificada por inspeção do repositório após uma construção real.

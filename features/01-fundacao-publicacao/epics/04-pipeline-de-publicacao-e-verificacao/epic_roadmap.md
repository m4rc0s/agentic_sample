# Tactical Roadmap: 04-pipeline-de-publicacao-e-verificacao

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Checker & Prova de Reprovação ] ──► [ Ciclo 2: Integração Contínua & Gancho de Entrega ]
```

A ordem importa: o checker é escrito e **provado** antes de entrar na integração contínua. Automatizar um verificador que nunca reprovou é automatizar uma aprovação garantida.

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Checker de invariantes:** verificação executável de INV-01 e INV-02 sobre a saída construída, com relatório legível, contagem de páginas examinadas e código de saída correto.
2. **Pacote 2 — Prova de reprovação:** violação semeada de cada invariante, reprovação confirmada e semeadura desfeita.
3. **Pacote 3 — Integração contínua:** construção e verificação a cada mudança, com a versão da ferramenta fixada e o job reprovando quando o checker reprova.
4. **Pacote 4 — Gancho de entrega e pré-visualização:** o ponto de entrega ao provedor documentado à espera da decisão, e o comando de pré-visualização local registrado.

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** A verificação de invariantes de publicação satisfaz o critério de conclusão do método. **Confirmada e vigente**: [`team_playbook.md`](../../../../team_playbook.md) §4.1 e [`technical_agreement.md`](../../../../technical_agreement.md) §4.1 estabelecem a regra, e ela é geral do método — vale para qualquer produto sem domínio rico, não é exceção concedida a este site.
* **Suposição 2:** Concluir a feature sem entrega em produção é aceitável. Confirmada: a decisão de hospedagem foi adiada pelo capitão, e o épico entrega tudo o que não depende dela.
* **Risco 1:** Checker que aprova por vacuidade — passa porque não examinou nada. **Mitigação:** a impossibilidade de verificar é reprovação explícita, e o número de páginas examinadas faz parte do relatório de aprovação.
* **Risco 2:** Checker que nunca foi visto reprovar. **Mitigação:** a prova por violação semeada de cada invariante é entrega obrigatória, não verificação opcional.
* **Risco 3:** Versão da ferramenta de construção variar entre a máquina de trabalho e a integração contínua, produzindo saídas diferentes e verificação não reprodutível. **Mitigação:** versão fixada no workflow e idêntica à homologada nos acordos técnicos.
* **Risco 4:** Configurar entrega para um provedor por conveniência, tomando por conta própria uma decisão que é do capitão. **Mitigação:** ausência de configuração de entrega é critério de verificação explícito de uma das tarefas.

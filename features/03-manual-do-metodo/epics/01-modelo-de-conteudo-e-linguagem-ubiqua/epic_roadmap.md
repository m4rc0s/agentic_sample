# Tactical Roadmap: 01-modelo-de-conteudo-e-linguagem-ubiqua

> **Planejamento Tático de Execução das Entregas Deste Épico**

---

## 🎯 Metas e Cronograma de Execução

```text
[ Ciclo 1: Checker de Vocabulário (INV-03.b) ] ──► [ Ciclo 2: Página do Glossário (INV-04) ] ──► [ Ciclo 3: Verificação de Ponta a Ponta ]
```

---

## 📦 Pacotes de Entrega (Deliverables)

1. **Pacote 1 — Checker de vocabulário:** `forbidden_synonyms.tsv` com o subconjunto seguro de sinônimos proibidos e `check_vocabulary.sh`, comprovado nas duas direções.
2. **Pacote 2 — Glossário publicado:** a seção `method/` com o glossário canônico em inglês, termo original em português citado, e navegação primária atualizada.
3. **Pacote 3 — Verificação:** os três checkers do site (`check_invariants.sh` INV-01/INV-02, `check_vocabulary.sh` INV-03.b) rodando juntos e passando sobre a saída construída com o novo conteúdo.

---

## ⚠️ Riscos e Suposições

* **Suposição 1:** Um checker de dependência zero não consegue verificar INV-03.a (consistência semântica de uso) nem a plenitude de INV-04.a (se a citação sustenta de fato a afirmação). Ambas ficam como exigência editorial, registrada honestamente em vez de fabricar automação inexistente — coerente com `technical_agreement.md` §4.1: "falhar em silêncio é violação de acordo técnico."
* **Risco 1:** Uma lista de sinônimos proibidos grande demais produziria falsa reprovação sobre palavras com significado legítimo independente (ex.: "feature", "task", "README", "user story" — todos vocabulário aprovado em outro contexto do próprio glossário). **Mitigação:** a lista automatizada foi deliberadamente restrita a frases sem colisão de sentido; o restante do catálogo é editorial.
* **Risco 2:** A página do glossário precisa citar os sinônimos proibidos por definição — o que faria o próprio checker reprová-la se ela não fosse exempta. **Mitigação:** carve-out explícito e documentado no cabeçalho do script, no mesmo padrão do carve-out de redirect stub que `check_invariants.sh` já usa para INV-01.
* **Risco 3:** Os épicos `02`–`05` desta feature, ao consumir o glossário, poderiam divergir de tradução termo a termo se cada um decidisse por conta própria. **Mitigação:** a regra de derivação de `plan.md` §4 — estender vocabulário é sempre editar este `plan.md`, nunca decisão local de uma página de conteúdo.

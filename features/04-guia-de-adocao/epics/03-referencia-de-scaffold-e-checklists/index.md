# Epic Spec: 03-referencia-de-scaffold-e-checklists

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar a referência dos três comandos de `scripts/scaffold.sh` (`feature`, `epic`, `app`) — cada um executado de verdade, com a saída real documentada — e os checklists de Definition of Ready e Definition of Done de `team_playbook.md` §3–4.
* **Bounded Context Relacionado:** **Nenhum.** Este épico não modela domínio de negócio — publica a saída verificada de um script existente e reproduz dois checklists já homologados. A §1 do [`plan.md`](plan.md) registra e justifica essa ausência.

Este épico fecha a feature: depois do caminho feliz (`01`) e dos prompts (`02`), é aqui que o adotante encontra a referência de comandos e critérios de qualidade a que ele volta durante todo o trabalho, não só no início.

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico não cunha vocabulário novo. Usa os termos já canônicos do glossário publicado pela feature `03`/épico `01` — `Feature`, `Épico`, `Manifesto`, `Definition of Ready (DoR)`, `Definition of Done (DoD)`.

| Termo de Negócio | Definição Semântica | Fonte |
| :--- | :--- | :--- |
| **`Saída Verificada`** | O texto de console produzido por uma execução real de um comando, capturado e publicado sem edição — em oposição a uma saída descrita de memória ou aproximada. | Critério de aceitação do plano de features aprovado, §Feature 04 |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

> **Nota de forma:** o molde deste arquivo pede cenários de mutação de estado e emissão de evento de domínio. Este épico não tem nem um nem outro. Os cenários abaixo verificam a fidelidade da referência publicada.

### Cenário 1: Os três comandos foram executados de verdade
* **Dado que:** `scripts/scaffold.sh` aceita os comandos `feature`, `epic` e `app`.
* **Quando:** cada um é executado numa cópia do repositório fora da árvore de trabalho.
* **Então:** a saída de console de cada execução é capturada e publicada sem edição de conteúdo — apenas de formatação para o bloco de código.

### Cenário 2: A estrutura de arquivos gerada corresponde à documentada
* **Dado que:** cada comando de `scaffold.sh` gera um conjunto de arquivos.
* **Quando:** a árvore de arquivos resultante de cada execução é inspecionada.
* **Então:** a lista de arquivos publicada na referência corresponde exatamente à lista real produzida pela execução.

### Cenário 3: Os checklists reproduzem DoR e DoD sem alterar o sentido
* **Dado que:** `team_playbook.md` §3 e §4 definem o Definition of Ready e o Definition of Done.
* **Quando:** os checklists publicados são comparados com o original.
* **Então:** cada item aparece com o mesmo critério, sem paráfrase que amoleça ou endureça a exigência original.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Página publicada:** `apps/site/content/en/guide/reference.md`

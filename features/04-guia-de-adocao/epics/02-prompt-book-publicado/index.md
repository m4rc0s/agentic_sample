# Epic Spec: 02-prompt-book-publicado

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar os seis prompts de `.agents/prompts_guide.md` em formato copiável, **idênticos** ao arquivo de origem — sem parafrasear, resumir ou "melhorar" nenhum deles.
* **Bounded Context Relacionado:** **Nenhum.** Este épico não modela domínio de negócio próprio — consome o glossário canônico da feature `03`/épico `01` e reproduz um artefato existente. A §1 do [`plan.md`](plan.md) registra e justifica essa ausência.

Este épico depende do épico `01` apenas na ordem de publicação da feature (branda, não rígida — ver [`../../feat_roadmap.md`](../../feat_roadmap.md)): a página que ele produz é o material que o quickstart referencia em suas etapas de definição de feature e modelagem de domínio.

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico não cunha vocabulário novo. Usa os termos já canônicos do glossário publicado pela feature `03`/épico `01`.

| Termo de Negócio | Definição Semântica | Fonte |
| :--- | :--- | :--- |
| **`Prompt Book`** | O conjunto dos seis prompts padronizados de `.agents/prompts_guide.md`, um por etapa do ciclo de vida do método, projetados para serem usados literalmente como entrada de um agente de IA. | `.agents/prompts_guide.md`, título do documento |
| **`Fidelidade de Reprodução`** | A garantia de que o texto publicado de um prompt é idêntico, caractere por caractere no corpo do prompt, ao texto do arquivo de origem — a prova viva de INV-05 (autoconsistência) aplicada a este épico. | `team_playbook.md` §4.1, catálogo de invariantes de artefato |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

> **Nota de forma:** o molde deste arquivo pede cenários de mutação de estado e emissão de evento de domínio. Este épico não tem nem um nem outro — é a publicação fiel de um artefato existente. Os cenários abaixo verificam exatamente essa fidelidade.

### Cenário 1: Os seis prompts estão todos presentes e na ordem do ciclo
* **Dado que:** `.agents/prompts_guide.md` define seis etapas, da Inception à Auditoria.
* **Quando:** a página publicada é inspecionada.
* **Então:** as seis etapas aparecem, na mesma ordem, cada uma com seu prompt em um bloco de código copiável.

### Cenário 2: Cada prompt publicado é idêntico ao original
* **Dado que:** o corpo de cada prompt em `.agents/prompts_guide.md` está delimitado por um bloco ` ```text `.
* **Quando:** o bloco correspondente na página publicada é comparado caractere por caractere com o original.
* **Então:** não há divergência — nenhuma palavra trocada, nenhuma reformulação, nenhuma "melhoria" editorial.

### Cenário 3: A página não introduz vocabulário fora do glossário
* **Dado que:** o glossário canônico já define `Feature`, `Épico`, `Domain Enabler`, `plan.md`, `tasks.md`.
* **Quando:** o texto de apresentação em torno dos prompts (não os prompts em si, que são citação literal) é revisado.
* **Então:** nenhum termo usado diverge da tradução publicada no glossário, e nenhum sinônimo proibido aparece.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Página publicada:** `apps/site/content/en/guide/prompt-book.md`

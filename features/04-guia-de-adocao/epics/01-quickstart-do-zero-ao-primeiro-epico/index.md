# Epic Spec: 01-quickstart-do-zero-ao-primeiro-epico

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar o caminho feliz completo — do template vazio ao primeiro `plan.md` aprovado — como uma única página sequencial, para que um adotante nunca precise abrir o repositório para descobrir o próximo passo.
* **Bounded Context Relacionado:** **Nenhum.** Este épico não modela domínio de negócio — é um épico de apresentação e ativação, e a §1 do [`plan.md`](plan.md) registra e justifica essa ausência, no mesmo padrão já adotado pelos épicos sem domínio das features `01` e `03`.

Este é o primeiro épico da feature e o que estabelece a jornada de referência: os épicos `02` e `03` aprofundam partes específicas dela (os prompts, os comandos), mas é aqui que a jornada inteira aparece de ponta a ponta pela primeira vez.

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico não cunha vocabulário novo. Usa os termos já canônicos do glossário publicado pela feature `03`/épico `01` — `Workspace`, `Spec`, `Feature`, `Épico` (`Epic`), `Domain Enabler` — e não introduz sinônimo nem definição alternativa para nenhum deles.

| Termo de Negócio | Definição Semântica | Fonte |
| :--- | :--- | :--- |
| **`Contexto Base`** | Os quatro documentos de governança de raiz que um workspace recém-criado precisa ter preenchidos antes da primeira feature: `product_vision.md`, `architecture.md`, `technical_agreement.md`, `roadmap.md`. | `README.md` §"Inicializando o Contexto Base" |
| **`Caminho Feliz`** | A sequência mínima e sem desvio de passos que leva um adotante do template vazio a um primeiro `plan.md` aprovado, sem cobrir casos de erro ou variações. | Termo operacional deste épico, não do corpus |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

> **Nota de forma:** o molde deste arquivo pede cenários de mutação de estado e emissão de evento de domínio. Este épico não tem nem um nem outro — é uma página de apresentação. Os cenários abaixo verificam o que de fato existe: a fidelidade e a completude do caminho publicado.

### Cenário 1: O caminho é completo, do template ao primeiro plano aprovado
* **Dado que:** um adotante nunca abriu o repositório `agentic_sample`.
* **Quando:** ele segue apenas a página de quickstart publicada.
* **Então:** ele consegue clonar o template, preencher o contexto base, subir a sessão do agente e chegar a um primeiro `plan.md` aprovado, sem precisar abrir nenhum outro arquivo do repositório para descobrir o próximo passo.

### Cenário 2: Todo comando publicado foi executado, não descrito de memória
* **Dado que:** a página cita comandos de shell.
* **Quando:** esses comandos são conferidos contra `README.md` e a estrutura real do repositório.
* **Então:** cada um corresponde exatamente a um comando documentado e verificável no repositório — nenhum comando é inventado ou aproximado.

### Cenário 3: A nota sobre agentes suportados é verificada, não copiada
* **Dado que:** a página inclui uma nota sobre quais agentes de IA são suportados hoje.
* **Quando:** essa nota é comparada com o conteúdo real de `AGENTS.md` e `CLAUDE.md` em `main`.
* **Então:** a nota descreve com precisão o que cada arquivo documenta hoje, sem inflar nem subestimar — e não repete a lista aspiracional de `README.md` §1 sem qualificação.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Página publicada:** `apps/site/content/en/guide/quickstart.md`

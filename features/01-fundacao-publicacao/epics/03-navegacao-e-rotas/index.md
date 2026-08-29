# Epic Spec: 03-navegacao-e-rotas

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Dar a toda página um endereço único e estável, e um caminho para chegar até ela. Ao fim deste épico existe um mapa de rotas com prefixo de idioma, navegação primária, sumário de página e — o item central — a garantia de que **toda página publicada tem exatamente uma âncora canônica**.
* **Bounded Context Relacionado:** **Publicação.** Não é um contexto de negócio: é o contexto onde vivem as invariantes do artefato publicado, conforme reconhecido pelo [`team_playbook.md`](../../../../team_playbook.md) §4.1. Este épico é o primeiro da feature a ter modelagem conceitual real, ainda que magra — ver [`plan.md`](plan.md).

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

| Termo de Negócio | Definição Semântica | Sinônimos Proibidos (Evitar Alucinações) |
| :--- | :--- | :--- |
| **`Rota`** | O caminho pelo qual um conteúdo publicado é alcançado. Neste produto, toda rota nasce sob prefixo de idioma, ainda que apenas um idioma esteja ativo. | `url amigável`, `path`, `slug` |
| **`Âncora canônica`** | A **única** declaração, feita pela própria página, de qual é o seu endereço verdadeiro. É a resposta à pergunta "se este conteúdo aparecer em mais de um caminho, qual deles conta?". | `link permanente`, `url principal`, `canonical tag` |
| **`Prefixo de idioma`** | O segmento inicial da rota que identifica o idioma daquele conteúdo. Existe desde a primeira publicação, mesmo com um só idioma ativo, para que acrescentar idiomas não exija reescrever endereços. | `locale`, `sufixo de idioma` |
| **`Metadados de página`** | O conjunto mínimo que toda página declara sobre si: título, descrição, âncora canônica e idioma. | `SEO tags`, `head stuff` |
| **`Navegação primária`** | O conjunto estável de destinos oferecido em toda página, no cabeçalho. | `menu`, `navbar` |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: Toda página declara exatamente uma âncora canônica
* **Dado que:** o site foi construído por completo.
* **Quando:** cada página publicada é examinada.
* **Então:** cada uma declara **exatamente uma** âncora canônica — nem nenhuma, nem duas.
* **E:** nenhuma âncora canônica se repete entre páginas distintas. *(Verifica INV-01.)*

### Cenário 2: Toda rota nasce sob prefixo de idioma
* **Dado que:** apenas um idioma está ativo no site.
* **Quando:** o conjunto de rotas produzidas pela construção é examinado.
* **Então:** toda rota de conteúdo está sob o prefixo do seu idioma, sem exceção.
* **E:** a raiz do site conduz o visitante ao idioma padrão, sem deixá-lo sem destino.

### Cenário 3: Toda página se descreve corretamente
* **Dado que:** uma página publicada qualquer.
* **Quando:** seus metadados são examinados.
* **Então:** ela declara título próprio, descrição própria e o idioma correto do seu conteúdo.
* **E:** nenhum desses campos está vazio ou herdado por engano de outra página.

### Cenário 4: Violação de âncora única é detectável
* **Dado que:** duas páginas distintas declaram a mesma âncora canônica.
* **Quando:** a verificação de INV-01 é executada sobre o site construído.
* **Então:** a violação é reportada, identificando a âncora duplicada e as páginas envolvidas.
* **E:** a verificação **não** conclui com sucesso. *(A execução dessa verificação pertence ao épico [`04`](../04-pipeline-de-publicacao-e-verificacao/index.md).)*

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)

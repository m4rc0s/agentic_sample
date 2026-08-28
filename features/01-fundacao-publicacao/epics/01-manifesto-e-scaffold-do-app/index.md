# Epic Spec: 01-manifesto-e-scaffold-do-app

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Fazer a aplicação de publicação existir formalmente e compilar. Ao fim deste épico o produto tem um manifesto descritivo preenchido, uma estrutura mínima que transforma conteúdo em páginas, e a garantia de que nada do que a construção gera entra no controle de versão.
* **Bounded Context Relacionado:** **Nenhum.** Este épico não pertence a nenhum contexto de domínio — é um épico de habilitação, e a §1 do [`plan.md`](plan.md) registra e justifica essa ausência.

Este é o primeiro passo da feature e a dependência de todos os outros: enquanto não houver algo que compile e sirva, não há onde aplicar layout, não há rota a nomear e não há saída a verificar.

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico **não introduz vocabulário de negócio**. Os termos abaixo são operacionais e existem para eliminar ambiguidade entre agentes, não para definir domínio:

| Termo de Negócio | Definição Semântica | Sinônimos Proibidos (Evitar Alucinações) |
| :--- | :--- | :--- |
| **`Manifesto`** | O arquivo `app_liquid.md` na raiz da aplicação, que declara o que a aplicação é, sua stack, seu ponto de entrada e seu escopo de dependências. É a fonte de verdade sobre a aplicação para qualquer agente. | `config`, `metadata`, `descritor` |
| **`Construção`** | O ato de transformar todo o conteúdo de origem em um conjunto de arquivos publicáveis, uma única vez, antes da entrega. Não ocorre em tempo de requisição. | `runtime`, `execução`, `deploy` |
| **`Saída construída`** | O diretório resultante da construção. É **descartável e regenerável**, e por isso nunca entra no controle de versão. | `build de produção`, `artefato fonte` |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

> **Nota de forma:** o molde deste arquivo pede cenários de mutação de estado e emissão de evento de domínio. Este épico não tem nem um nem outro. Os cenários abaixo verificam o que de fato existe aqui — a construção e a integridade do que ela produz — em vez de simular transações inexistentes.

### Cenário 1: A aplicação compila e produz saída servível
* **Dado que:** a aplicação está registrada com seu manifesto preenchido e possui ao menos uma unidade de conteúdo.
* **Quando:** a construção é executada a partir da raiz da aplicação.
* **Então:** ela termina com código de saída 0, sem erro e sem aviso de template não resolvido.
* **E:** produz um diretório de saída contendo a página correspondente à unidade de conteúdo existente.

### Cenário 2: A saída construída não contamina o controle de versão
* **Dado que:** uma construção completa acabou de ser executada e o diretório de saída existe em disco.
* **Quando:** o estado do controle de versão é inspecionado.
* **Então:** nenhum arquivo gerado pela construção aparece como alteração pendente ou como candidato a versionamento.
* **E:** o repositório permanece limpo, coerente com o princípio de que a camada de código é consequencial e descartável.

### Cenário 3: O manifesto é fiel aos acordos técnicos
* **Dado que:** a stack do produto está homologada em [`technical_agreement.md`](../../../../technical_agreement.md) §1.
* **Quando:** o manifesto da aplicação é comparado com essa homologação.
* **Então:** a stack declarada no manifesto é **idêntica** à homologada, sem tecnologia a mais nem a menos.
* **E:** nenhum campo do manifesto permanece com valor de molde.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)

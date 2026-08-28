# Epic Spec: 02-sistema-visual-e-layout-base

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Dar forma a toda página. Ao fim deste épico existe um layout base que toda página herda, um sistema visual mínimo que dá consistência a essa forma, e os componentes de conteúdo que o material do método vai exigir — sem que nenhum conteúdo real precise ser escrito para isso.
* **Bounded Context Relacionado:** **Nenhum.** Épico puramente de apresentação; a §1 do [`plan.md`](plan.md) registra e justifica a ausência de domínio.

O sistema visual é entregue **mínimo por decisão**, não por pressa: cada elemento existe porque uma feature de conteúdo posterior o exigirá. Não há componente especulativo.

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico **não introduz vocabulário de negócio**. Os termos abaixo são de apresentação e existem para que agentes distintos nomeiem a mesma coisa do mesmo jeito:

| Termo de Negócio | Definição Semântica | Sinônimos Proibidos (Evitar Alucinações) |
| :--- | :--- | :--- |
| **`Layout base`** | O envelope que toda página herda: marcos semânticos, cabeçalho, rodapé e a região onde o conteúdo específico da página é inserido. Página alguma define seu próprio envelope. | `master page`, `wrapper`, `shell` |
| **`Escala`** | Um conjunto fechado e nomeado de valores permitidos para uma dimensão visual — tamanho de texto ou espaçamento. Valores fora da escala não são usados. | `tamanho arbitrário`, `px solto` |
| **`Modo de exibição`** | Uma das duas variantes de cor da interface, clara e escura. A escolha respeita a preferência declarada pelo sistema do visitante e pode ser sobreposta por ele. | `tema`, `skin`, `dark mode plugin` |
| **`Componente de conteúdo`** | Uma forma reutilizável de apresentar um tipo específico de material dentro do corpo de uma página: bloco de código, tabela, destaque e figura. | `widget`, `bloco customizado` |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

> **Nota de forma:** este épico não tem transação nem evento de domínio a verificar. Os cenários abaixo são de apresentação e acessibilidade — o que de fato é verificável aqui.

### Cenário 1: Toda página herda o mesmo envelope
* **Dado que:** o layout base está definido e uma página qualquer é publicada.
* **Quando:** essa página é construída e aberta.
* **Então:** ela apresenta os marcos semânticos de cabeçalho, navegação, conteúdo principal e rodapé, na mesma ordem e com a mesma estrutura de qualquer outra página.
* **E:** nenhum estilo é carregado de origem externa ao próprio site.

### Cenário 2: A preferência de exibição do visitante é respeitada
* **Dado que:** o visitante tem preferência de exibição declarada no seu sistema operacional.
* **Quando:** ele abre qualquer página pela primeira vez.
* **Então:** a página é apresentada no modo correspondente a essa preferência, sem intervenção dele.
* **E:** ao usar o alternador para escolher o outro modo, a escolha é respeitada e mantida nas páginas seguintes.

### Cenário 3: A página é utilizável apenas com o teclado
* **Dado que:** um visitante navega sem apontador, usando somente o teclado.
* **Quando:** ele percorre a página a partir do primeiro elemento focável.
* **Então:** o primeiro destino disponível é o atalho para o conteúdo principal, e cada elemento focável exibe indicação de foco claramente visível.
* **E:** a ordem de foco acompanha a ordem de leitura, sem saltos nem armadilhas.

### Cenário 4: O contraste sustenta os dois modos
* **Dado que:** o sistema visual define as cores de texto e de fundo para os modos claro e escuro.
* **Quando:** as combinações efetivamente aplicadas em texto corrido, texto secundário e elementos interativos são medidas nos dois modos.
* **Então:** todas atingem no mínimo a razão de contraste exigida para texto normal pelo nível AA das diretrizes de acessibilidade de conteúdo web.
* **E:** nenhuma informação é transmitida exclusivamente por cor.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)

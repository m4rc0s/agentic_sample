# Domain Enabler (Conceptual DDD Plan): 01-manifesto-e-scaffold-do-app

> **Instruções para o Agente Hermes / Modelador de Domínio:**  
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Esta é uma **declaração deliberada e justificada**, amparada pelo [`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo [`technical_agreement.md`](../../../../technical_agreement.md) §4.1, que reconhecem a ausência de domínio como **resultado legítimo da modelagem, não como falha dela**. As seções de Entidades, Eventos e Casos de Uso do molde foram **removidas em vez de preenchidas**: preenchê-las aqui produziria ficção.

### 1.1 Justificativa

O artefato que este épico habilita é um **site estático**. Ele não sustenta domínio conceitual porque lhe faltam, simultaneamente, as quatro condições que definem um:

1. **Não há transação.** Nada é solicitado, aceito ou recusado. Não existe comando que possa suceder ou falhar segundo uma regra.
2. **Não há mutação de estado.** O conteúdo é lido de arquivos versionados e compilado uma única vez. Nenhum estado é escrito, alterado ou consultado em tempo de requisição.
3. **Não há ciclo de vida de entidade.** Uma página não nasce, não transiciona entre estados e não é encerrada. Ela é um **artefato de apresentação**, não uma entidade com identidade e história.
4. **Não há regra de negócio invariante.** Não existe verdade de negócio que o sistema possa violar, porque não existe negócio sendo processado — existe texto sendo apresentado.

### 1.2 O que seria fabricar domínio aqui, e por que não foi feito

O molde convida a inventar uma entidade `Página`, com atributos `título` e `slug`, um evento `PáginaRenderizada` e uma invariante do tipo "toda página deve ter título". Nada disso resiste ao exame:

* **`Página` não é entidade de domínio.** Não tem identidade que persista através de mudanças de estado, porque não tem estado. É um arquivo compilado.
* **`PáginaRenderizada` não é evento de domínio.** Renderização acontece em tempo de construção, uma única vez, e **não tem consumidor**. Um evento que ninguém pode reagir a não é evento: é uma linha de log.
* **"Toda página deve ter título" não é invariante de domínio.** É uma regra de qualidade do artefato publicado — legítima, verificável, e por isso mesmo modelada onde pertence: como invariante de publicação nos épicos [`03`](../03-navegacao-e-rotas/plan.md) e [`04`](../04-pipeline-de-publicacao-e-verificacao/plan.md).

Fabricar essas três coisas satisfaria o molde e **desinformaria todo agente que lesse este arquivo depois**, que passaria a modelar código em torno de um domínio inexistente. O método existe precisamente para impedir invenção não ancorada em intenção de negócio; preencher este molde com ficção seria violá-lo enquanto se aparenta cumpri-lo.

---

## 2. Natureza Real do Épico: apresentação e habilitação

O que este épico entrega não é domínio — é **capacidade**:

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Apresentação e habilitação. Nenhuma lógica de negócio. |
| **Entrega** | O registro formal da aplicação e a estrutura mínima que compila conteúdo em páginas publicáveis. |
| **Fonte de verdade** | O manifesto `app_liquid.md`, que declara à cadeia de agentes o que a aplicação é, sem que ninguém precise varrer código. |
| **Reversibilidade** | Total. Toda a saída é regenerável a partir do conteúdo versionado, o que é exatamente o princípio de código consequencial e descartável. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a declaração de ausência de domínio **não dispensa verificação** — ela transfere o objeto verificado.

Este épico é, porém, o único da feature que **não enuncia invariante própria**: ele estabelece a fundação sobre a qual INV-01 e INV-02 passam a ser verificáveis, mas ainda não há saída publicada com rotas e canônicos onde verificá-las. Seu critério de conclusão é, portanto, o **cenário verificável de construção** definido no [`index.md`](index.md) §3:

1. A construção termina com código de saída 0 e produz saída servível.
2. Nenhum artefato de construção entra no controle de versão.
3. A stack do manifesto é idêntica à homologada nos acordos técnicos.

As invariantes de publicação que este épico torna possíveis são enunciadas e verificadas nos épicos [`03`](../03-navegacao-e-rotas/plan.md) e [`04`](../04-pipeline-de-publicacao-e-verificacao/plan.md).

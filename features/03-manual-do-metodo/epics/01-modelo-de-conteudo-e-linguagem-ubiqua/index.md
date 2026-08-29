# Epic Spec: 01-modelo-de-conteudo-e-linguagem-ubiqua

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Publicar o glossário canônico da Linguagem Ubíqua do método Liquid — a fonte única de vocabulário para todas as demais features de conteúdo — e enunciar as invariantes que o protegem: INV-03 (vocabulário único) e INV-04 (rastreabilidade). É o único épico do produto, além dos de `01-fundacao-publicacao`, cujo domínio conceitual é real, não magro: os termos do método em si.
* **Bounded Context Relacionado:** **O próprio método Liquid**, enquanto conceito publicado. Diferente de todos os épicos de `01-fundacao-publicacao` (cujo Bounded Context é "Publicação"), este épico modela o domínio conceitual do produto que o site *descreve*, não do site em si. É por isso que o relatório de plano (§2.1) o chama de "o `plan.md` real deste produto".

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

Este épico **é** o glossário — não consome um glossário externo. Os nove termos centrais e os dez termos de apoio estão modelados por inteiro em [`plan.md`](plan.md) §5 e §6, com definição, sinônimos proibidos, relações e fonte citável para cada um. Esta seção não duplica essa tabela; aponta para ela.

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: Todo termo central tem definição extraída do corpus, não inventada
* **Dado que:** o glossário em `plan.md` §5 é examinado termo a termo.
* **Quando:** cada definição é confrontada com o documento de origem citado.
* **Então:** a definição publicada corresponde ao que o documento de origem afirma, sem invenção nem distorção.

### Cenário 2: Toda tradução para o inglês tem justificativa registrada
* **Dado que:** um termo cunhado em português pelo corpus ("Algemas da IA", "Código Consequencial") é traduzido para publicação em inglês.
* **Quando:** a entrada do glossário para esse termo é examinada.
* **Então:** ela registra a justificativa da escolha de tradução, e não apenas a tradução em si.

### Cenário 3: Sinônimo proibido não aparece em conteúdo publicado (INV-03.b)
* **Dado que:** o site foi construído com a página do glossário e ao menos uma página consumidora publicadas.
* **Quando:** o checker de vocabulário é executado sobre a saída construída.
* **Então:** nenhum sinônimo proibido listado em `plan.md` §5–§6 é encontrado em texto publicado.
* **E:** quando um sinônimo proibido é semeado deliberadamente numa página de teste, o checker reprova com código de saída diferente de zero, identificando o termo e a página. *(Prova exigida em duas direções, mesmo padrão da feature `01`.)*

### Cenário 4: A tensão de idioma é honrada, não escondida
* **Dado que:** a página do glossário é publicada em inglês.
* **Quando:** um termo autoral em português é exibido.
* **Então:** o termo original em português aparece citado, junto da tradução — nunca só a tradução.

### Cenário 5: Rastreabilidade estrutural (INV-04.b) se sustenta
* **Dado que:** a página do glossário cita documentos de spec como fonte de cada termo.
* **Quando:** o checker de INV-02 da feature `01` é executado sobre o site construído.
* **Então:** toda citação de documento resolve para um arquivo existente no repositório — nenhuma referência morta.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)
* **Página publicada:** `apps/site/content/en/method/glossary.md`

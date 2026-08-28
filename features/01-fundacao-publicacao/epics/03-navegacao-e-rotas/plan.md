# Domain Enabler (Conceptual DDD Plan): 03-navegacao-e-rotas

> **Instruções para o Agente Hermes / Modelador de Domínio:**  
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 0. Enquadramento: que tipo de modelagem este arquivo contém

Este épico **não tem domínio de negócio** — pelas mesmas razões dos épicos [`01`](../01-manifesto-e-scaffold-do-app/plan.md) e [`02`](../02-sistema-visual-e-layout-base/plan.md): sem transação, sem mutação de estado, sem ciclo de vida de entidade.

Ele tem, porém, uma **invariante de publicação genuína**: uma verdade que o artefato publicado jamais pode violar, que não foi inventada para preencher molde e que é **verificável por checker automatizado**. É o objeto de modelagem deste arquivo.

O [`team_playbook.md`](../../../../team_playbook.md) §4.1 e o [`technical_agreement.md`](../../../../technical_agreement.md) §4.1 estabelecem, como **regra geral do método**, que invariantes do artefato entregue são objeto legítimo de verificação quando o `plan.md` declara ausência de domínio conceitual. Este épico opera sob essa regra: o rigor exigido é o mesmo dos testes de invariante de domínio; o que muda é o objeto verificado. A invariante abaixo é enunciada, portanto, como **regra verificável** — sem tabela, sem ORM, sem SQL e sem migration, que aqui não teriam sentido algum.

---

## 1. Entidades de Domínio e Value Objects (Conceitual)

**Nenhuma entidade de domínio.** Uma página é artefato de apresentação, não entidade: não tem identidade que persista através de mudanças de estado, porque não tem estado.

Existe, contudo, **um value object legítimo** — e ele é o motivo de este épico existir:

### Value Object: `ÂncoraCanônica`
* **Descrição:** Objeto imutável, sem identidade própria, definido inteiramente pelo seu valor: o endereço verdadeiro de um conteúdo publicado. Duas âncoras com o mesmo valor **são** a mesma âncora — e é precisamente essa propriedade que torna a duplicação detectável.
* **Atributos:** o endereço, composto pelo prefixo de idioma e pelo caminho do conteúdo dentro daquele idioma.
* **Por que é value object e não entidade:** não tem ciclo de vida nem identidade separável do seu valor. Se o valor muda, não é a mesma âncora que mudou de estado — é outra âncora. Essa é a definição estrita de value object, e é o que justifica modelá-la aqui em vez de omiti-la.

---

## 2. Regras de Negócio Invariantes (Regras Inegociáveis)

Este produto não tem invariante de **negócio**. Tem uma invariante de **publicação**, enunciada abaixo como regra verificável:

### INV-01 — Âncora única

> **Toda página publicada declara exatamente uma âncora canônica, e nenhuma âncora canônica é declarada por duas páginas distintas.**

Decompõe-se em duas condições, ambas necessárias:

* **INV-01.a (Existência e unicidade por página):** para cada página publicada, o número de âncoras canônicas declaradas é **exatamente 1**. Zero é violação — a página não afirma qual é o seu endereço verdadeiro. Duas ou mais é violação — a página afirma dois endereços verdadeiros, que é o mesmo que não afirmar nenhum.
* **INV-01.b (Unicidade global):** para o conjunto de todas as páginas publicadas, o número de âncoras canônicas distintas é **igual** ao número de páginas. Duas páginas com a mesma âncora significam que uma delas está declarando ser outra.

**Por que isto é invariante e não preferência:** a âncora canônica é a única afirmação que o produto faz sobre a identidade de um conteúdo publicado. Violada, o conteúdo passa a ser alcançável por caminhos que se contradizem, e qualquer referência externa perde a garantia de apontar para a coisa certa. É o análogo exato, no artefato publicado, de uma invariante de identidade de entidade em um domínio de negócio — e este produto, cujo pilar declarado é a **navegação por âncoras programáticas**, seria incoerente ao violá-la.

**Estado da verificação:** enunciada aqui, verificada pelo checker entregue no épico [`04`](../04-pipeline-de-publicacao-e-verificacao/plan.md). Um enunciado sem verificação não satisfaria o critério de conclusão do [`team_playbook.md`](../../../../team_playbook.md) §4.1, que é explícito ao dizer que declarar ausência de domínio **não dispensa verificação**.

---

## 3. Eventos de Domínio (Domain Events)

**Nenhum evento de domínio.**

Não há transição de estado a comunicar e não haveria consumidor para o comunicado. A construção do site ocorre uma única vez, antes da publicação, e nada no produto observa ou reage a ela. Registrar aqui um evento do tipo `PáginaPublicada` seria inventar um emissor sem receptor — ficção com aparência de modelagem.

---

## 4. Casos de Uso / Comandos e Consultas (Use Cases)

**Nenhum caso de uso.** Não há comando, não há consulta e não há mutação de estado a orquestrar.

O que existe é uma **regra de derivação**, aplicada uniformemente em tempo de construção:

> A âncora canônica de uma página é derivada de forma determinística da sua rota, e a rota é derivada da posição do conteúdo dentro do seu idioma. Nenhuma página declara âncora à mão.

Essa uniformidade é o que faz INV-01.a valer por construção e torna INV-01.b verificável de forma barata: se as âncoras são derivadas e as rotas são únicas, a duplicação só pode surgir de erro estrutural — que é exatamente o que o checker do épico [`04`](../04-pipeline-de-publicacao-e-verificacao/plan.md) existe para pegar.

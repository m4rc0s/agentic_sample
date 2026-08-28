# Domain Enabler (Conceptual DDD Plan): 04-pipeline-de-publicacao-e-verificacao

> **Instruções para o Agente Hermes / Modelador de Domínio:**  
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 0. Enquadramento: que tipo de modelagem este arquivo contém

Este épico **não tem domínio de negócio**, pelas razões já estabelecidas nos épicos [`01`](../01-manifesto-e-scaffold-do-app/plan.md) e [`02`](../02-sistema-visual-e-layout-base/plan.md).

Ele carrega as **duas invariantes de publicação** do produto — INV-01, herdada do épico [`03`](../03-navegacao-e-rotas/plan.md), e INV-02, enunciada aqui — e é o épico que as torna **executáveis**. Enunciar sem verificar não fecha épico algum: o [`team_playbook.md`](../../../../team_playbook.md) §4.1 é explícito ao estabelecer que declarar ausência de domínio **não dispensa verificação**, e que um épico sem domínio e sem checker de invariantes verificáveis não é `Done` — é um épico sem critério de conclusão.

A regra sob a qual este épico opera está escrita, vigente e é **geral do método**, não uma concessão a este produto: [`team_playbook.md`](../../../../team_playbook.md) §4.1 e [`technical_agreement.md`](../../../../technical_agreement.md) §4.1 estabelecem que invariantes do artefato entregue, verificadas por checker automatizado, substituem os testes de invariante de domínio quando o `plan.md` declara a ausência deste. **A suíte verde continua obrigatória; muda o objeto verificado, não o rigor.** Este épico é a materialização dessa regra: ele entrega o checker que a torna operante.

---

## 1. Entidades de Domínio e Value Objects (Conceitual)

**Nenhuma entidade de domínio.** O value object `ÂncoraCanônica` está modelado no épico [`03`](../03-navegacao-e-rotas/plan.md) §1 e é consumido aqui sem redefinição — vocabulário único é regra, e redefinir o mesmo conceito em dois lugares é como se perde.

Este épico acrescenta um segundo value object, necessário para enunciar INV-02:

### Value Object: `Referência`
* **Descrição:** Objeto imutável, sem identidade própria, definido pelo alvo que aponta. Uma referência é **resolvível** ou **morta**; não há terceiro estado, e essa dicotomia é o que a torna verificável.
* **Atributos:** o alvo apontado e a origem que o aponta — a página onde a referência aparece.
* **Espécies relevantes:**
  - **Referência interna de navegação:** aponta para outra rota do próprio site publicado.
  - **Referência a documento de origem:** aponta para um arquivo de governança, uma feature ou um épico do repositório.
* **Por que é value object e não entidade:** não tem ciclo de vida nem identidade separável do par alvo/origem. Duas referências com o mesmo alvo e a mesma origem são a mesma referência.

---

## 2. Regras de Negócio Invariantes (Regras Inegociáveis)

Enunciadas como **regras verificáveis** sobre o artefato publicado. Sem tabela, sem ORM, sem SQL, sem migration — nenhum dos quatro existe neste produto.

### INV-01 — Âncora única *(herdada do épico [`03`](../03-navegacao-e-rotas/plan.md) §2)*

> **Toda página publicada declara exatamente uma âncora canônica, e nenhuma âncora canônica é declarada por duas páginas distintas.**

Modelada em detalhe no épico `03`. Aqui ela deixa de ser enunciado e passa a ser condição executável de entrega.

### INV-02 — Integridade referencial

> **Nenhuma página publicada referencia arquivo de governança, feature, épico ou rota interna que não exista de fato no repositório ou na saída construída.**

Decompõe-se em duas condições, ambas necessárias:

* **INV-02.a (Rotas internas resolvem):** toda referência interna de navegação aponta para uma rota que a construção efetivamente produziu. Um caminho que não corresponde a nenhuma página construída é violação.
* **INV-02.b (Documentos de origem existem):** toda referência a arquivo de governança, feature ou épico aponta para um arquivo que existe no repositório. Citar um documento que não existe é violação.

**Por que isto é invariante e não preferência:** este produto tem como tese que **a spec é o software** e que o site é a prova de que o método é praticado. Uma página que cita um documento inexistente não é um link quebrado — é o produto **afirmando sobre si algo que não se sustenta**. INV-02 é a defesa mínima contra isso: ela impede que o site prometa o que o repositório não entrega. É a invariante que mais diretamente protege a honestidade do produto, e por isso é inegociável.

**Nota de fronteira:** INV-02 verifica **existência**, não veracidade. Que uma página cite um documento existente não garante que o descreva corretamente. Verificar isso é a invariante de autoconsistência do catálogo de referência do [`team_playbook.md`](../../../../team_playbook.md) §4.1, deliberadamente fora do escopo desta feature: ela exige o glossário e o conteúdo real, que pertencem a features posteriores.

### Condição de honestidade do verificador

> **Um verificador que não consegue concluir a verificação deve reprovar, nunca aprovar.**

Não é invariante do artefato, e sim a regra que dá sentido às duas acima: um checker que passa quando não examinou nada produz **confiança injustificada**, que é pior do que não ter checker nenhum — porque, sem ele, ninguém supõe estar protegido. Está registrada como acordo técnico em [`technical_agreement.md`](../../../../technical_agreement.md) §4.1 e é cenário de aceitação no [`index.md`](index.md) §3.

---

## 3. Eventos de Domínio (Domain Events)

**Nenhum evento de domínio.**

A tentação aqui é maior do que nos épicos anteriores, porque existe de fato uma sequência temporal — construir, verificar, aprovar ou reprovar — que se parece com uma cadeia de eventos. Não é. Trata-se de **passos de um processo automatizado**, executados em ordem fixa dentro de uma única execução, sem emissor, sem assinante e sem ninguém a reagir. Modelar `ConstruçãoConcluída` ou `VerificaçãoReprovada` como eventos de domínio criaria um barramento imaginário que não existe em lugar nenhum do produto.

---

## 4. Casos de Uso / Comandos e Consultas (Use Cases)

**Nenhum caso de uso de domínio.** Não há comando de negócio nem mutação de estado a orquestrar.

O que existe é um **procedimento de verificação**, descrito no nível conceitual — a forma concreta pertence ao [`tasks.md`](tasks.md):

### Procedimento: `VerificarInvariantesDePublicação`
1. **Pré-condição:** existe uma saída construída com ao menos uma página examinável. Se não existir, **reprovar imediatamente** pela condição de honestidade do verificador — não aprovar por vacuidade.
2. **Verificar INV-01.a:** para cada página, contar as âncoras canônicas declaradas. Qualquer contagem diferente de exatamente uma é violação.
3. **Verificar INV-01.b:** comparar o número de âncoras distintas com o número de páginas. Diferença é violação, e as âncoras repetidas são identificadas.
4. **Verificar INV-02.a:** para cada referência interna de navegação, confirmar que a rota apontada foi produzida pela construção.
5. **Verificar INV-02.b:** para cada referência a documento de origem, confirmar que o arquivo existe no repositório.
6. **Desfecho:** sem violação, **aprovar**, informando quantas páginas foram examinadas — o número é parte do resultado, porque é ele que distingue aprovação real de aprovação por vacuidade. Com qualquer violação, **reprovar**, reportando a invariante ferida e o arquivo onde foi ferida, e concluir com código de saída diferente de zero.

### Prova de que o procedimento reprova

Um procedimento de verificação que nunca reprovou **não foi verificado**. Fecha este épico a obrigação de semear deliberadamente uma violação de INV-01 e uma de INV-02, confirmar a reprovação em cada caso e desfazer a semeadura. Sem essa prova, o critério de conclusão não está satisfeito.

# Domain Enabler (Conceptual DDD Plan): 02-pilares-e-ciclo

> **Instruções para o Agente Hermes / Modelador de Domínio:**
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual próprio. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Esta é uma declaração deliberada e justificada, amparada pelo
[`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo
[`technical_agreement.md`](../../../../technical_agreement.md) §4.1, no mesmo
padrão já adotado pelos épicos sem domínio das features `01` e `03`. O
domínio conceitual real deste produto está inteiramente modelado em
[`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md);
este épico **consome** esse glossário — não modela um domínio próprio.

### 1.1 Justificativa

Este épico publica duas seções de uma página estática: uma tabela reproduzindo
os três pilares já descritos em `README.md`, e uma lista ordenada
reproduzindo o fluxograma de sete etapas já descrito no mesmo documento. Não
há:

1. **Transação.** Listar pilares e etapas não é uma operação que possa ser aceita ou recusada segundo uma regra de negócio.
2. **Mutação de estado.** O conteúdo é texto e marcação fixos, compilados uma única vez.
3. **Ciclo de vida de entidade.** Não há objeto de domínio nascendo, mudando ou sendo encerrado — há uma tabela e uma lista sendo apresentadas.
4. **Regra de negócio invariante.** A única disciplina aplicável é vocabular (INV-03, herdada) e de fidelidade de reprodução — as sete etapas e os três pilares precisam corresponder exatamente às suas fontes, o que é um critério editorial de tradução fiel, não uma invariante de domínio.

### 1.2 Por que "o ciclo" não é um Domain Event nem uma máquina de estados

O relatório de plano (§3, Feature 02) descreve esta seção como "uma
representação visual do ciclo de vida". Seria tentador modelar cada etapa
como um estado e cada seta como uma transição — um Evento de Domínio por
etapa. Isso não resiste ao exame: o "ciclo" aqui não é executado por este
site nem por nenhum sistema que ele opera; é uma **descrição textual e
estática** de um processo que acontece em outro lugar (no workspace de quem
adota o método), reproduzida como conteúdo editorial. Um Evento de Domínio
pressupõe um sistema que emite e um consumidor que reage — nenhum dos dois
existe aqui. A feature `03`, épico `03` ("Ciclo de Vida e Papéis"), já
enfrentou a mesma tentação e chegou à mesma conclusão para o conjunto de seis
etapas de `index.md`; este épico reproduz um subconjunto diferente de sete
etapas (as de `README.md`, não as de `index.md`), pela mesma razão editorial,
não uma modelagem de domínio nova.

### 1.3 Por que as sete etapas de `README.md` e não as seis de `index.md`

`index.md` seção 4 descreve seis etapas do fluxo do agente; `README.md`
descreve um fluxograma de sete nós (`Governança Raiz` até `Auditoria
Contínua`), já reproduzido em inglês por
`apps/site/content/en/method/lifecycle-and-roles.md` como as "seis etapas"
citando `index.md`. As duas fontes descrevem o mesmo processo com um nível de
detalhe ligeiramente diferente — o fluxograma do `README.md` isola
"Validação Humana" como uma etapa própria entre a modelagem de domínio e a
fila operacional, enquanto o texto de `index.md` a descreve embutida na etapa
de modelagem. O briefing desta feature pede explicitamente a reprodução das
**sete** etapas do `README.md`, com esse nome e essa contagem — é essa fonte,
e não `index.md`, que este épico reproduz. As duas descrições não se
contradizem (INV-05): a etapa de validação humana existe em ambas, apenas com
granularidade textual diferente entre um documento e outro. Nenhuma
correção foi feita a nenhuma das duas fontes; este épico apenas escolhe qual
delas reproduzir, conforme instruído.

---

## 2. Natureza Real do Épico: conteúdo editorial que consome o glossário

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Editorial. Reproduz, sem modelar domínio novo, dois trechos já descritos nos documentos de governança de raiz. |
| **Entrega** | Uma tabela dos três pilares e uma lista ordenada das sete etapas do ciclo, publicadas na home. |
| **Fonte de verdade** | `README.md`, seções "Os 3 Pilares do Modelo Liquid" e "O Ciclo de Desenvolvimento com Agentes" — citadas, nunca reinventadas. |
| **Dependência de vocabulário** | Consome os termos `Workspace`, `Manifest`, `Anchor`, `Domain Enabler`, `Consequential Code` e `Conceptually-Strict DDD`, todos definidos em [`../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md`](../../../03-manual-do-metodo/epics/01-modelo-de-conteudo-e-linguagem-ubiqua/plan.md) §5–§6. Nenhum termo novo é cunhado aqui. |

---

## 3. Critério de Conclusão Deste Épico

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a
declaração de ausência de domínio não dispensa verificação. Este épico não
enuncia invariante própria — herda INV-01, INV-02 (feature `01`) e INV-03.b
(feature `03`, épico `01`) — e seu critério de conclusão é:

1. A tabela dos três pilares usa os nomes exatos de `README.md:21-25`, na tradução já fixada por `03/ecosystem-positioning.md`.
2. A lista ordenada reproduz as sete etapas de `README.md:130-138`, na mesma ordem, sem etapa omitida ou fundida.
3. Nenhum arquivo novo foi criado em `layouts/_shortcodes/` ou `layouts/_partials/` — apenas Markdown padrão (tabela, lista ordenada) sobre os componentes já existentes.
4. A página está publicada, construída pelo Hugo, sem violar INV-01/INV-02 nem INV-03.b.

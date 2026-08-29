# Domain Enabler (Conceptual DDD Plan): 02-sistema-visual-e-layout-base

> **Instruções para o Agente Hermes / Modelador de Domínio:**  
> Este documento é o coração conceitual do épico. **NÃO escreva esquemas de banco de dados, ORMs ou SQL aqui.** Modele o domínio estritamente no nível conceitual (Entidades, Invariantes e Eventos de Domínio).

---

## 1. Resultado da Modelagem: **ausência de domínio conceitual**

**Este épico não tem domínio conceitual. Nenhuma entidade, nenhum value object, nenhuma invariante de negócio, nenhum evento de domínio e nenhum caso de uso.**

Declaração deliberada e justificada, amparada pelo [`team_playbook.md`](../../../../team_playbook.md) §4.1 e pelo [`technical_agreement.md`](../../../../technical_agreement.md) §4.1, que reconhecem a ausência de domínio como **resultado legítimo da modelagem**. As seções de Entidades, Eventos e Casos de Uso do molde foram **removidas em vez de preenchidas**.

### 1.1 Justificativa

Este épico define **como o conteúdo se apresenta**, e apresentação não é domínio. As quatro condições que caracterizariam um domínio continuam ausentes, pelas mesmas razões do épico [`01`](../01-manifesto-e-scaffold-do-app/plan.md) — e por uma razão adicional específica deste:

**Nada aqui é decidido pelo negócio.** Uma escala tipográfica, uma paleta e um conjunto de espaçamentos são decisões de forma. Não expressam regra que o negócio possa violar; expressam consistência visual. Se a paleta mudar amanhã, nenhuma verdade de negócio é ferida — o site apenas fica com outra aparência. Esse é o teste que separa domínio de apresentação, e este épico fica inteiro do lado da apresentação.

### 1.2 O que seria fabricar domínio aqui, e por que não foi feito

O molde convida a inventar uma entidade `Tema`, com estados `claro` e `escuro`, um evento `TemaAlternado` e uma invariante do tipo "o tema deve ser sempre um dos dois valores". A tentação é maior aqui do que no épico `01`, porque existe **de fato** uma alternância de estado — e é justamente por isso que vale explicitar por que ela não é domínio:

* **A alternância é preferência de exibição de um visitante no navegador dele.** Não é estado do produto: não é compartilhada, não é auditada, não é consultada por nenhuma outra parte do sistema e desaparece se o visitante limpar o navegador.
* **`TemaAlternado` não tem consumidor no domínio.** Nada no produto reage a essa alternância além do próprio navegador que a executou.
* **"O tema deve ser um dos dois valores" é uma restrição de implementação da interface**, não uma verdade de negócio. Não há negócio a proteger.

Modelar isso como domínio criaria uma entidade que nenhum agente futuro conseguiria localizar em lugar nenhum do produto, porque ela não existe fora do navegador do visitante.

---

## 2. Natureza Real do Épico: apresentação

| Dimensão | Conteúdo |
| :--- | :--- |
| **Natureza** | Apresentação pura. Nenhuma lógica de negócio. |
| **Entrega** | O envelope compartilhado por toda página, o sistema visual mínimo que lhe dá consistência e os componentes de conteúdo que as features de conteúdo vão consumir. |
| **Restrição herdada** | Sem pré-processador, sem framework de estilo, sem origem externa. Decorre da homologação de stack e do pilar de isolamento absoluto. |
| **Princípio de escopo** | Cada elemento do sistema visual existe porque uma feature de conteúdo posterior o exigirá. Nada especulativo. |

---

## 3. Restrições de Qualidade Verificáveis (não são invariantes de domínio)

Este épico não enuncia invariante de publicação própria — INV-01 e INV-02 pertencem aos épicos [`03`](../03-navegacao-e-rotas/plan.md) e [`04`](../04-pipeline-de-publicacao-e-verificacao/plan.md). O que ele sustenta são **restrições de qualidade da apresentação**, verificáveis por inspeção direta e registradas como cenários no [`index.md`](index.md) §3:

| # | Restrição | Como se verifica |
| :--- | :--- | :--- |
| **Q-01** | Toda página herda o mesmo envelope semântico. | Inspeção da estrutura de marcos semânticos na saída construída. |
| **Q-02** | Os dois modos de exibição atingem contraste AA para texto normal. | Medição das combinações de cor efetivamente aplicadas, nos dois modos. |
| **Q-03** | A página é operável somente por teclado, com foco visível e atalho para o conteúdo. | Percurso de foco do primeiro ao último elemento focável. |
| **Q-04** | Nenhum recurso é carregado de origem externa ao site. | Inspeção das referências a recursos na saída construída. |

Pela regra do [`team_playbook.md`](../../../../team_playbook.md) §4.1, a ausência de domínio não dispensa verificação: estas quatro restrições são o objeto verificado deste épico.

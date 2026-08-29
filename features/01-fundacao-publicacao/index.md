# Feature Spec: 01-fundacao-publicacao

> **Visão Geral e Escopo de Negócio da Funcionalidade**

---

## 1. Proposta de Valor e Problema do Usuário

* **O Problema:** O método Spec-Driven Development (Liquid) existe hoje apenas como um conjunto de documentos dentro de um repositório. Quem não clona o repositório não conhece o método, e quem clona precisa ler arquivos soltos para entender a tese. Não existe nenhum caminho pelo qual uma ideia escrita chegue ao público — nem uma página, nem um endereço, nem um processo de publicação. Antes de decidir *o que dizer*, falta a capacidade de *dizer qualquer coisa*.
* **O Valor Entregue:** Passa a existir a capacidade de publicar. Qualquer conteúdo aprovado atravessa um caminho conhecido, repetível e verificado até virar uma página pública, com endereço estável e verificação automática antes da entrega. Esta feature não entrega valor ao visitante final de forma isolada: ela é a condição de existência de todas as features de conteúdo que vêm depois.
* **Persona Impactada:** Diretamente, o **mantenedor do método** — quem escreve, revisa e publica o conteúdo, e precisa confiar que o que foi aprovado é o que chega ao público, íntegro. Indiretamente, todas as demais personas do produto: nenhuma delas alcança o conteúdo antes desta capacidade existir.

**Natureza da feature:** habilitadora. Ela entrega *capacidade de entregar valor*, não valor de negócio observável pelo visitante. É uma dependência rígida de todas as outras features do produto.

---

## 2. Escopo Funcional e Limites (In / Out of Scope)

### ✅ No Escopo:
- Registro formal da aplicação de publicação e de seu manifesto descritivo, coerente com os acordos técnicos homologados do produto.
- Esqueleto da aplicação: a estrutura mínima que compila conteúdo em páginas e as serve.
- Sistema visual mínimo: escala tipográfica, escala de espaçamento, paleta, modo claro e escuro, e um conjunto pequeno de componentes de conteúdo — bloco de código, tabela, destaque e figura/diagrama.
- Layout base compartilhado por toda página: cabeçalho, rodapé, navegação primária e sumário de página.
- Estrutura de rotas com prefixo de idioma em todas as rotas desde a primeira publicação, ainda que apenas um idioma esteja ativo.
- Metadados corretos em toda rota publicada: título, descrição, endereço canônico e idioma declarado.
- Acessibilidade e responsividade de base: marcos semânticos, contraste adequado nos dois modos, foco visível, navegação por teclado, atalho para o conteúdo principal e layout fluido.
- Processo de publicação com pré-visualização antes da entrega, e verificação automática que reprova a publicação diante de violação.
- O verificador automático das duas invariantes de publicação — âncora única e integridade referencial —, que assume, neste produto, o papel de suíte de testes exigida pelo Definition of Done.
- Uma única página de exemplo, explicitamente provisória, cuja função é provar que o caminho de publicação funciona ponta a ponta.

### ❌ Fora do Escopo (Fronteiras Explícitas):
- **Qualquer conteúdo real de página.** Todo texto sobre o método pertence às features `02` (narrativa de entrada) e `03` (manual do método). A página de exemplo desta feature é descartável por construção e será substituída.
- Cartões sociais, mapa do site, feed de assinatura e registro de mudanças: pertencem à feature `06`.
- Busca no site, em qualquer forma.
- Métricas de audiência, telemetria e qualquer coleta de dados do visitante.
- Comentários, cadastro, formulários e qualquer capacidade que exija processamento no servidor.
- Tradução de conteúdo: a *estrutura* multilíngue está dentro do escopo; o *conteúdo traduzido* está fora.
- Contratação de hospedagem, registro de endereço próprio e configuração de entrega em produção: dependem de decisão adiada pelo capitão (§6.2).

---

## 3. Histórias de Usuário Chave (User Stories)

* **US-01:** Como **mantenedor do método**, eu quero que exista um caminho único e repetível que transforme um texto aprovado em página publicada para que **publicar deixe de ser um ato manual e irreprodutível**.
* **US-02:** Como **mantenedor do método**, eu quero que toda página publicada tenha um endereço estável e único para que **o conteúdo possa ser referenciado por terceiros sem quebrar e sem ambiguidade sobre qual é o endereço verdadeiro**.
* **US-03:** Como **mantenedor do método**, eu quero que a publicação seja automaticamente reprovada quando uma página apontar para algo que não existe para que **o site nunca afirme mais do que o repositório sustenta**.
* **US-04:** Como **mantenedor do método**, eu quero ver o resultado antes de publicar para que **erros sejam corrigidos antes de chegarem ao público, e não depois**.
* **US-05:** Como **leitor com deficiência visual ou que navega por teclado**, eu quero que toda página tenha estrutura semântica, contraste suficiente e foco visível para que **o conteúdo seja utilizável independentemente de como eu navego**.

---

## 4. Decomposição em Épicos de Domínio (`epics/`)

Esta feature é subdividida nos seguintes pacotes atômicos de valor:

1. **[`epics/01-manifesto-e-scaffold-do-app/`](epics/01-manifesto-e-scaffold-do-app/index.md):** Registro formal da aplicação e o esqueleto mínimo que compila e serve uma página. *Domínio conceitual: nenhum.*
2. **[`epics/02-sistema-visual-e-layout-base/`](epics/02-sistema-visual-e-layout-base/index.md):** Sistema visual mínimo, layout base compartilhado e componentes de conteúdo. *Domínio conceitual: nenhum.*
3. **[`epics/03-navegacao-e-rotas/`](epics/03-navegacao-e-rotas/index.md):** Mapa de rotas, prefixo de idioma, navegação primária e endereço canônico por página. *Modela INV-01.*
4. **[`epics/04-pipeline-de-publicacao-e-verificacao/`](epics/04-pipeline-de-publicacao-e-verificacao/index.md):** Construção, pré-visualização, verificação automática e o gancho de publicação. *Modela INV-01 e INV-02.*

---

## 5. Critérios de Aceitação Gerais da Feature

- [x] Critério 1: O manifesto da aplicação de publicação existe, está integralmente preenchido e declara tipo, propósito, ponto de entrada e escopo de dependências.
- [x] Critério 2: A stack declarada no manifesto da aplicação é **idêntica** à homologada em [`technical_agreement.md`](../../technical_agreement.md) §1.
- [x] Critério 3: Toda rota publicada declara título, descrição, endereço canônico e idioma corretos.
- [x] Critério 4: Toda rota publicada nasce sob prefixo de idioma, ainda que apenas um idioma esteja ativo.
- [x] Critério 5: A verificação automática roda no processo de publicação e **reprova** diante de endereço canônico duplicado ou de referência a algo inexistente — comprovadamente, com violação semeada e resultado reprovado.
- [x] Critério 6: Nenhum artefato gerado pela construção do site entra no controle de versão.
- [x] Critério 7: Contraste, foco visível e navegação por teclado verificados na página de exemplo, nos dois modos de exibição.
- [x] Critério 8: Uma página de exemplo provisória é publicada com sucesso, provando o caminho ponta a ponta, sem conter conteúdo real do método.

> **Critério deliberadamente não satisfeito nesta entrega:** o relatório de planejamento previa também *"uma página é publicada no endereço acordado e carrega em produção"*. Não há endereço acordado: hospedagem e endereço próprio são decisão adiada pelo capitão (§6.2). A entrega vai até a fronteira do que não exige essas decisões — o site é construído e verificado a cada mudança, e o ponto de publicação fica documentado como gancho à espera da decisão.

---

## 6. Decisões do Capitão — Estado

Das seis decisões que esta entrega esbarrou, **uma permanece em aberto**. As demais foram fechadas ou adiadas pelo capitão e ficam registradas aqui com o efeito que tiveram sobre a entrega.

### 6.1 🟡 EM ABERTO — Idioma do corpus de spec
**Decisão relacionada já tomada:** o idioma do conteúdo publicado está fechado — **o site nasce em inglês**.

**A incoerência que fica:** os documentos de spec deste produto — inclusive os desta feature — estão em português, coerentes com o corpus de governança existente, que é 100% português. A feature `05` (prova viva) publica arquivos de spec como páginas, para provar que o método foi seguido. Specs em português dentro de um site em inglês **enfraquecem exatamente a prova que a feature `05` quer dar**: o visitante anglófono encontra, como evidência principal, documentos que não consegue ler.

**As opções, todas do capitão:** migrar o corpus inteiro de governança e spec para inglês; manter o corpus em português e fazer a feature `05` exibir as specs como artefato autêntico, com apresentação e comentário em inglês; ou tornar o site bilíngue de fato.

**Como a entrega manteve todas elas possíveis:** a estrutura de rotas nasceu com prefixo de idioma em todas as rotas, ainda que só um idioma esteja ativo. Qualquer uma das três saídas é adotável **sem retrabalho de roteamento**.

---

### 6.2 ⏸️ ADIADA — Hospedagem e endereço próprio
**Estado:** fora do radar do capitão por ora. Não bloqueia esta feature nem as seguintes.

**Efeito sobre a entrega, mantido deliberadamente:**
- O processo de publicação **constrói e verifica** o site a cada mudança e guarda o resultado construído como artefato. **Nenhum provedor foi configurado**, e o ponto de entrega está documentado como gancho à espera da decisão.
- O endereço base é **parametrizável no momento da construção**, com valor neutro por padrão. **Nenhuma URL de provedor está gravada no repositório.** Quando houver endereço, ele entra como parâmetro, sem alteração de conteúdo.

**Consequência aceita:** o site é verificável mas não está no ar. Nenhuma outra feature fica bloqueada por isso.

**Observação factual que precede a retomada:** o repositório se chama `agentic_sample` e o método se chama *Spec-Driven Development (Liquid)*. O produto ainda não tem nome próprio, e essa definição precede a do endereço.

---

### 6.3 ✅ FECHADA — Onde o site vive
**Decisão:** o site vive em `apps/site/`, neste repositório — que é o que o método manda.

**Tensão que permanece registrada, sem bloquear nada:** quem adotar o template herda o site do método dentro do próprio produto. A feature `04` (guia de adoção) precisará instruir explicitamente a remoção da aplicação após a clonagem — o que, convenientemente, é uma boa demonstração de que código em `apps/` é descartável.

---

### 6.4 ✅ FECHADA — Definition of Done para produto sem domínio de negócio
**Decisão:** emenda escrita e vigente. Ver [`team_playbook.md`](../../team_playbook.md) §4.1 e [`technical_agreement.md`](../../technical_agreement.md) §4.1.

Um `plan.md` **pode** declarar explicitamente a ausência de domínio conceitual, com justificativa, como resultado legítimo da modelagem. Quando declara, o critério de conclusão aceita **invariantes de artefato verificadas por checker automatizado** no lugar dos testes de invariante de domínio. A suíte verde continua obrigatória; muda o objeto verificado, não o rigor.

**Efeito direto sobre esta feature:** os épicos `01` e `02` declaram ausência de domínio e são concluíveis por essa regra; os épicos `03` e `04` enunciam INV-01 e INV-02 e são verificados pelo checker. A regra é geral do método, não uma exceção concedida a este site.

---

### 6.5 ✅ FECHADA — Grafia do arquivo de acordos técnicos
**Decisão:** renomeado para [`technical_agreement.md`](../../technical_agreement.md), com histórico preservado, título interno atualizado e todas as referências do repositório corrigidas.

---

### 6.6 ✅ FECHADA — Gerador estático
**Decisão:** **Hugo**, homologado em [`technical_agreement.md`](../../technical_agreement.md) §1. A escolha do checker em Bash com dependência zero deriva dela e está homologada no mesmo lugar.

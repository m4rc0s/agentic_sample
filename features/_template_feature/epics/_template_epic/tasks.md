# Tasks: [Nome do Épico]

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**  
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Domínio e Testes Unitários de Invariantes (Core)
- [ ] **Task 1.1 — Scaffold do Domínio:** Criar as entidades e value objects conceituais mapeados no [`plan.md`](plan.md) na aplicação alvo [`apps/[nome-da-aplicacao]`](../../../apps/).
  - *Critério de Verificação:* Entidades estruturadas com tipagem estrita e imutabilidade.
- [ ] **Task 1.2 — Testes Unitários de Invariantes:** Escrever os testes unitários cobrindo todas as regras invariantes (RN-01, RN-02, RN-03) de [`plan.md`](plan.md).
  - *Critério de Verificação:* Testes falhando inicialmente (TDD) ou passando com implementação pura sem persistência.

### Fase 2: Casos de Uso e Eventos de Domínio
- [ ] **Task 2.1 — Implementação dos Use Cases:** Implementar os comandos/handlers descritos no plano de domínio.
  - *Critério de Verificação:* Casos de uso orquestrando entidades e disparando eventos de domínio.
- [ ] **Task 2.2 — Emissão de Eventos de Domínio:** Configurar os payloads e emissão dos eventos definidos na tabela de eventos.
  - *Critério de Verificação:* Testes unitários validando a publicação do evento correto.

### Fase 3: Persistência & Modelagem Física (Database & Adapters)
- [ ] **Task 3.1 — Modelagem Física e Migrations:** Definir os schemas DDL, tabelas do banco de dados, tipos SQL, índices e criar as migrations na aplicação alvo [`apps/[nome-da-aplicacao]`](../../../apps/).
  - *Critério de Verificação:* Migrations executadas com sucesso no banco de dados homologado em [`techinal_deal.md`](../../../techinal_deal.md).
- [ ] **Task 3.2 — Implementação do Repositório / Mappers:** Implementar o adapter de persistência (ex: SQLx, Prisma, JPA) mapeando registros do banco para Entidades de Domínio sem vazar tipos SQL para o Core.
  - *Critério de Verificação:* Testes de integração de repositório validando persistência e recuperação de dados.

### Fase 4: Camada de Interface / Entrypoints & Validação E2E
- [ ] **Task 4.1 — DTOs e Exposição de Endpoint / Controller:** Conectar o caso de uso ao entrypoint HTTP/gRPC conforme definido no manifesto [`app_liquid.md`](../../../apps/), definindo DTOs de entrada e saída.
  - *Critério de Verificação:* Requisições válidas retornam HTTP 200/201; requisições que violam invariantes retornam erros semânticos tratados.
- [ ] **Task 4.2 — Testes de Integração e E2E:** Executar a suíte de testes de integração ponta a ponta validando os cenários Gherkin de [`index.md`](index.md).
  - *Critério de Verificação:* 100% dos testes da suíte passando com código 0.

### Fase 5: Fechamento e Auditoria
- [ ] **Task 5.1 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local e global para `Done`.
- [ ] **Task 5.2 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

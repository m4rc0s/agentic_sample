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

### Fase 3: Camada de Interface / Adapters & Validação
- [ ] **Task 3.1 — Exposição de Endpoint / Controller:** Conectar o caso de uso ao entrypoint HTTP/gRPC conforme definido no manifesto [`app_liquid.md`](../../../apps/).
  - *Critério de Verificação:* Requisições válidas retornam HTTP 200/201; requisições que violam invariantes retornam erros semânticos tratados.
- [ ] **Task 3.2 — Testes de Integração e E2E:** Executar a suíte de testes de integração ponta a ponta validando os cenários Gherkin de [`index.md`](index.md).
  - *Critério de Verificação:* 100% dos testes da suíte passando com código 0.

### Fase 4: Fechamento e Auditoria
- [ ] **Task 4.1 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local e global para `Done`.
- [ ] **Task 4.2 — Git Commit:** Gerar commit semântico (Conventional Commits) em branch próprio registrando a entrega do épico.
- [ ] **Task 4.3 — Pull Request:** Abrir o Pull Request para o branch principal e obter aprovação do Reviewer & QA.

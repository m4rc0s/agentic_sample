# Tasks: 04-pipeline-de-publicacao-e-verificacao

> **Fila de Tarefas Atômicas e Operacionais para Execução pelo Agente de IA**  
> **Regra:** Execute uma tarefa de cada vez. Valide os testes antes de marcar a caixa de seleção como concluída `[x]`.

> **Nota de nível:** este é o **único** arquivo deste épico onde nome de stack, caminho de arquivo e comando aparecem.

---

## 📋 Fila Sequencial de Execução

### Fase 1: Checker de Invariantes

- [x] **Task 1.1 — Criar `apps/site/scripts/check_invariants.sh` com a estrutura de reprovação:** Bash com `set -euo pipefail`, apenas utilitários POSIX (`grep`, `sed`, `sort`, `find`), **sem nenhuma dependência externa**, conforme homologado em [`technical_agreement.md`](../../../../technical_agreement.md) §1. Aceitar o diretório da saída construída como argumento e reprovar quando ele não existir, estiver vazio ou não contiver nenhum `.html`.
  - *Critério de Verificação:* executado contra um diretório inexistente e contra um diretório vazio, reporta a impossibilidade de verificar e termina com código diferente de zero em ambos os casos.

- [x] **Task 1.2 — Implementar INV-01.a (uma âncora por página):** Para cada `.html` da saída, contar as ocorrências de `rel="canonical"`. Reprovar quando a contagem for diferente de 1, informando o arquivo e a contagem encontrada.
  - *Critério de Verificação:* uma página sem canônico e uma página com dois canônicos são ambas reprovadas, com o arquivo identificado na mensagem.

- [x] **Task 1.3 — Implementar INV-01.b (unicidade global):** Extrair o valor do canônico de cada página, ordenar e detectar repetições. Reprovar informando o valor duplicado e todas as páginas que o declaram.
  - *Critério de Verificação:* duas páginas com o mesmo canônico são reprovadas; a mensagem nomeia as duas.

- [x] **Task 1.4 — Implementar INV-02.a (rotas internas resolvem):** Extrair os `href` internos das páginas construídas e confirmar que cada um corresponde a um arquivo existente na saída. Ignorar âncoras de fragmento, `mailto:` e endereços externos, que não são objeto desta invariante.
  - *Critério de Verificação:* um link para uma rota inexistente é reprovado, com a página de origem e o alvo morto identificados.

- [x] **Task 1.5 — Implementar INV-02.b (documentos de origem existem):** Detectar, no texto publicado, referências a arquivos de governança, features e épicos do repositório, e confirmar que cada arquivo existe. Reprovar informando a referência morta e a página que a contém.
  - *Critério de Verificação:* uma referência a um documento de governança inexistente é reprovada, com origem e alvo identificados.

- [x] **Task 1.6 — Emitir um relatório legível e o código de saída correto:** Reportar, por invariante, a aprovação ou a lista de violações, e informar **quantas páginas foram examinadas**. Terminar com 0 apenas na ausência total de violações.
  - *Critério de Verificação:* `bash apps/site/scripts/check_invariants.sh apps/site/public; echo $?` imprime `0` no site íntegro e um valor diferente de zero em qualquer violação.

### Fase 2: Prova de que o Checker Reprova

- [x] **Task 2.1 — Semear violação de INV-01 e confirmar reprovação:** Introduzir temporariamente um canônico duplicado na saída construída, executar o checker, registrar a saída e o código, e **desfazer a semeadura**.
  - *Critério de Verificação:* código de saída diferente de zero, mensagem apontando INV-01 e as páginas envolvidas; após desfazer, o checker volta a aprovar.

- [x] **Task 2.2 — Semear violação de INV-02 e confirmar reprovação:** Introduzir temporariamente uma referência a arquivo inexistente, executar o checker, registrar a saída e o código, e **desfazer a semeadura**.
  - *Critério de Verificação:* código de saída diferente de zero, mensagem apontando INV-02 e a referência morta; após desfazer, o checker volta a aprovar.

### Fase 3: Integração Contínua

- [x] **Task 3.1 — Criar `.github/workflows/site.yml`:** Instalar o Hugo `extended` em **versão fixada**, idêntica à homologada em [`technical_agreement.md`](../../../../technical_agreement.md) §1; construir `apps/site`; executar o checker sobre a saída. O job reprova quando o checker reprova.
  - *Critério de Verificação:* o arquivo declara a versão do Hugo explicitamente, sem `latest`; o passo do checker não é tolerante a falha.

- [x] **Task 3.2 — Guardar a saída construída como artefato:** Publicar o resultado da construção como artefato do job, e **não configurar entrega para nenhum provedor**.
  - *Critério de Verificação:* `grep -rniE 'pages|netlify|vercel|cloudflare|deploy' .github/workflows/` não retorna nenhuma configuração de entrega ativa.

- [x] **Task 3.3 — Documentar o gancho de entrega:** Registrar no workflow, como comentário, e no `README.md` da aplicação, o ponto exato onde a entrega ao provedor entrará quando a decisão de hospedagem for retomada ([`../../index.md`](../../index.md) §6.2).
  - *Critério de Verificação:* o gancho está descrito em ambos os lugares, sem nenhum provedor nomeado como escolhido.

### Fase 4: Pré-visualização e Fechamento

- [x] **Task 4.1 — Documentar a pré-visualização local:** Registrar `hugo server --source apps/site` no `README.md` da aplicação, junto do comando de construção e do de verificação.
  - *Critério de Verificação:* seguindo apenas o `README.md`, um agente constrói, pré-visualiza e verifica o site sem consultar nenhum outro arquivo.
- [x] **Task 4.2 — Atualização de Status:** Atualizar [`quick_status.md`](quick_status.md) local, o da feature e o radar global da raiz.
- [x] **Task 4.3 — Git Commit:** Gerar commit semântico (Conventional Commits) registrando a entrega do épico.

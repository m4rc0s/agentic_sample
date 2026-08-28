# App Manifest: site

- **app_name:** site
- **app_type:** frontend-web (site estático, compilado em tempo de build e servido sem processo de servidor)
- **tech_stack:** Hugo `extended` 0.165.0 (gerador); Go templates + CSS puro escrito à mão, sem pré-processador e sem `node_modules` (Frontend/UI); Bash + utilitários POSIX, dependência zero (testes: checker de invariantes de publicação). Sem backend primário, sem framework web e sem banco de dados — não aplicáveis a este produto. Stack idêntica à homologada em [`technical_agreement.md`](../../technical_agreement.md) §1.
- **app_description:** Site público do método Spec-Driven Development (Liquid). Materializa a camada consequencial do produto: compila conteúdo Markdown em páginas HTML estáticas, com rotas sob prefixo de idioma, metadados completos por página e um sistema visual próprio. Não processa domínio de negócio — não há transação, mutação de estado nem ciclo de vida de entidade. Sustenta duas invariantes de publicação verificadas por checker automatizado: INV-01 (âncora canônica única por página) e INV-02 (integridade referencial das referências publicadas). Nesta entrega o site contém apenas uma página de exemplo provisória; o conteúdo real pertence às features `02` e `03`.
- **entrypoint:** `apps/site/hugo.toml` — configuração raiz a partir da qual a construção é executada (`hugo --source apps/site`). Não há processo de servidor: o ponto de entrada é a construção, não uma execução.
- **dependencies_scope:** **Isolamento absoluto.** Nenhuma dependência de runtime, nenhum gerenciador de pacotes, nenhum `node_modules` e nenhum recurso carregado de origem externa ou CDN — todo asset é servido pelo próprio site. As duas únicas ferramentas exigidas na máquina de construção são o binário do Hugo `extended` e um shell POSIX. Nenhuma comunicação com serviço externo, síncrona ou assíncrona, em tempo de construção ou de visita.

---

## Como Construir, Pré-visualizar e Verificar

Ver [`README.md`](README.md) para os comandos. Resumo:

| Ação | Comando |
| :--- | :--- |
| Pré-visualizar localmente | `hugo server --source apps/site` |
| Construir | `hugo --source apps/site` |
| Verificar INV-01 e INV-02 | `bash apps/site/scripts/check_invariants.sh apps/site/public` |

O endereço base é parametrizável no momento da construção (`hugo --source apps/site --baseURL <endereço>`), porque a hospedagem e o endereço próprio são decisão adiada pelo capitão — ver [`features/01-fundacao-publicacao/index.md`](../../features/01-fundacao-publicacao/index.md) §6.2.

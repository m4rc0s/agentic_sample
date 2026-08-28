# `apps/site` — Publication Application

Camada consequencial do produto: compila o conteúdo Markdown deste diretório em
um site estático. O manifesto descritivo é [`app_liquid.md`](app_liquid.md), e a
stack é a homologada em [`technical_agreement.md`](../../technical_agreement.md) §1.

> **Estado atual:** esta aplicação contém apenas uma página de exemplo
> provisória. O conteúdo real do site pertence às features `02` (narrativa de
> entrada) e `03` (manual do método). Ver
> [`features/01-fundacao-publicacao/index.md`](../../features/01-fundacao-publicacao/index.md).

---

## Comandos

Todos executados a partir da **raiz do repositório**.

| Ação | Comando |
| :--- | :--- |
| **Pré-visualizar** localmente | `hugo server --source apps/site` |
| **Construir** | `hugo --source apps/site` |
| **Verificar** INV-01 e INV-02 | `bash apps/site/scripts/check_invariants.sh apps/site/public` |
| Construir com endereço definido | `hugo --source apps/site --baseURL "https://exemplo.org/"` |

A pré-visualização sobe em `http://localhost:1313/` e recarrega a cada alteração.
Como todas as rotas nascem sob prefixo de idioma, a raiz redireciona para `/en/`.

**Pré-requisito:** o binário do Hugo `extended`, na versão homologada. Nenhuma
outra dependência — não há gerenciador de pacotes, não há `node_modules` e nada
é carregado de origem externa.

---

## Verificação

O checker [`scripts/check_invariants.sh`](scripts/check_invariants.sh) é parte da
**suíte de verificação** do produto, não um utilitário auxiliar: é ele que
autoriza ou reprova a entrega, conforme
[`team_playbook.md`](../../team_playbook.md) §4.1.

| Invariante | O que exige |
| :--- | :--- |
| **INV-01** Âncora única | Toda página publicada declara **exatamente uma** âncora canônica, e nenhuma âncora se repete entre páginas distintas. |
| **INV-02** Integridade referencial | Toda referência interna resolve para uma rota construída, e toda referência a documento de governança, feature ou épico resolve para um arquivo existente no repositório. |

Códigos de saída:

| Código | Significado |
| :--- | :--- |
| `0` | Todas as invariantes se sustentam. |
| `1` | Ao menos uma invariante foi violada. A entrega não deve prosseguir. |
| `2` | **Não foi possível verificar** — saída de construção ausente, vazia ou sem página publicada. |

O código `2` é deliberado: um verificador que passa sem ter verificado produz
confiança injustificada, o que é pior do que não ter verificador nenhum.

---

## Publicação

A integração contínua ([`.github/workflows/site.yml`](../../.github/workflows/site.yml))
constrói o site com a versão do Hugo fixada, roda o checker e **reprova o job
quando o checker reprova**. O resultado construído é guardado como artefato.

**Não há entrega para nenhum provedor de hospedagem.** Essa decisão foi adiada
pelo capitão ([`features/01-fundacao-publicacao/index.md`](../../features/01-fundacao-publicacao/index.md) §6.2),
e por isso:

* nenhuma URL de provedor está gravada neste repositório;
* `baseURL` tem valor neutro por padrão e é injetado no momento da construção;
* o **gancho de entrega** está marcado como comentário ao final do workflow, na
  posição em que a entrega entrará — **depois** do checker, nunca antes: não se
  entrega o que não foi verificado.

Adotar um provedor altera o workflow e nada mais no repositório.

---

## Estrutura

```text
apps/site/
├── app_liquid.md          # Manifesto descritivo da aplicação
├── hugo.toml              # Configuração raiz — é o entrypoint da construção
├── assets/css/main.css    # Sistema visual completo, CSS puro escrito à mão
├── content/en/            # Conteúdo, sob prefixo de idioma desde o dia 1
├── layouts/
│   ├── baseof.html        # Envelope herdado por toda página
│   ├── home.html          # Página inicial
│   ├── single.html        # Página de conteúdo
│   ├── list.html          # Página de listagem
│   ├── _partials/         # head, header, footer, nav, toc
│   ├── _shortcodes/       # callout, figure
│   └── _markup/           # Render hook de tabela
└── scripts/
    └── check_invariants.sh  # Checker de INV-01 e INV-02
```

A saída da construção (`public/`) é **descartável e regenerável**, e por isso
não entra no controle de versão.

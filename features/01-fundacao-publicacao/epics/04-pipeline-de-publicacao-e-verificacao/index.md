# Epic Spec: 04-pipeline-de-publicacao-e-verificacao

> **Escopo Detalhado do Épico, Bounded Contexts e Critérios de Aceite**

---

## 1. Objetivo do Épico

* **Objetivo Principal:** Transformar publicar em um caminho verificado. Ao fim deste épico, toda mudança é construída e submetida a um verificador automático das duas invariantes de publicação, que **reprova** a entrega quando alguma delas é violada. O ponto de entrega ao provedor fica documentado como gancho, à espera da decisão de hospedagem.
* **Bounded Context Relacionado:** **Publicação.** Mesmo contexto do épico [`03`](../03-navegacao-e-rotas/index.md), aqui levado à verificação executável.

Este é o épico que fecha a feature. Ele é também o que dá ao produto a resposta para uma pergunta que todo adotante do método fará: *como verifico um produto que não tem invariante de negócio?*

---

## 2. Linguagem Ubíqua do Épico (Glossário de Termos)

| Termo de Negócio | Definição Semântica | Sinônimos Proibidos (Evitar Alucinações) |
| :--- | :--- | :--- |
| **`Checker`** | O verificador automatizado das invariantes de publicação. Faz parte da suíte de verificação do produto, não é utilitário auxiliar: é ele que autoriza ou reprova a entrega. | `linter`, `script de apoio`, `validador opcional` |
| **`Violação`** | Uma condição concreta em que uma invariante enunciada não se sustenta na saída construída. Toda violação é reportada com a invariante ferida e o arquivo onde ela foi ferida. | `warning`, `aviso`, `pendência` |
| **`Reprovação`** | O desfecho de uma verificação que encontrou violação, ou que **não conseguiu concluir**. Interrompe a entrega. | `falha suave`, `alerta`, `resultado parcial` |
| **`Violação semeada`** | Uma violação introduzida de propósito e temporariamente, para provar que o checker de fato reprova. Um checker que nunca reprovou não é um checker. | `teste de mesa`, `simulação` |
| **`Gancho de entrega`** | O ponto documentado do processo onde a entrega ao provedor de hospedagem entrará, quando essa decisão for retomada. Hoje é documentação, não automação. | `deploy`, `publicação em produção` |

---

## 3. Critérios de Aceitação (Behavior-Driven / Gherkin)

### Cenário 1: O site íntegro é aprovado
* **Dado que:** o site foi construído por completo e nenhuma invariante está violada.
* **Quando:** o checker é executado sobre a saída construída.
* **Então:** ele reporta a aprovação de INV-01 e INV-02, indicando quantas páginas examinou.
* **E:** conclui com código de saída 0.

### Cenário 2: Âncora canônica duplicada reprova a entrega
* **Dado que:** duas páginas distintas declaram a mesma âncora canônica.
* **Quando:** o checker é executado sobre essa saída.
* **Então:** ele reporta a violação de **INV-01**, identificando a âncora duplicada e as páginas envolvidas.
* **E:** conclui com código de saída **diferente de zero**, e a integração contínua reprova.

### Cenário 3: Referência a algo inexistente reprova a entrega
* **Dado que:** uma página referencia um arquivo de governança, feature ou épico que não existe no repositório, ou aponta para uma rota interna que a construção não produziu.
* **Quando:** o checker é executado sobre essa saída.
* **Então:** ele reporta a violação de **INV-02**, identificando a referência morta e a página que a contém.
* **E:** conclui com código de saída **diferente de zero**, e a integração contínua reprova.

### Cenário 4: O checker não passa quando não consegue verificar
* **Dado que:** a saída construída está ausente, vazia, ou não contém nenhuma página examinável.
* **Quando:** o checker é executado.
* **Então:** ele reporta que **não foi possível verificar** e reprova.
* **E:** em nenhuma hipótese conclui com sucesso sem ter verificado, porque um verificador que passa em silêncio produz confiança injustificada.

### Cenário 5: A entrega ao provedor permanece uma decisão em aberto
* **Dado que:** a decisão de hospedagem foi adiada pelo capitão.
* **Quando:** o processo automatizado é executado numa mudança qualquer.
* **Então:** ele constrói, verifica e — no máximo — guarda o resultado construído como artefato.
* **E:** **nenhum provedor de hospedagem é configurado ou contactado**, e o ponto onde a entrega entrará está documentado.

---

## 4. Aplicação Alvo em `apps/`

* **Aplicação Consequencial:** [`apps/site`](../../../../apps/site/)
* **Manifesto:** [`apps/site/app_liquid.md`](../../../../apps/site/app_liquid.md)

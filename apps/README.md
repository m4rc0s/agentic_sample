# Camada de Aplicações Físicas (`apps/`)

> **"O Código como Consequência Descartável"**

A pasta `apps/` abriga todo o software executável gerado iterativamente pelos agentes de IA a partir das especificações de [`features/`](../features/).

---

## 📜 A Regra de Ouro: O Manifesto `app_liquid.md`

Para que qualquer Agente de IA compreenda o papel de um software sem precisar varrer árvores sintáticas profundas ou depender de ferramentas específicas de linguagem, **TODA aplicação dentro de `apps/` DEVE conter um arquivo `app_liquid.md` na sua raiz**.

### Exemplo de Estrutura:

```text
apps/
├── api-core/
│   ├── app_liquid.md        # Manifesto descritivo da aplicação
│   └── src/ ...             # Código-fonte consequencial
├── web-client/
│   ├── app_liquid.md        # Manifesto descritivo da aplicação
│   └── src/ ...             # Código-fonte consequencial
└── _template_app/
    └── app_liquid.md        # Molde para novas aplicações
```

---

## 🛠️ Como Criar uma Nova Aplicação em `apps/`

1. Crie uma subpasta com o identificador em kebab-case: `mkdir apps/meu-servico`
2. Copie o template: `cp apps/_template_app/app_liquid.md apps/meu-servico/`
3. Preencha o `app_liquid.md` com a stack homologada em [`techinal_deal.md`](../techinal_deal.md).
4. Peça ao agente para gerar o código inicial (scaffold de código) guiado pelo manifesto.

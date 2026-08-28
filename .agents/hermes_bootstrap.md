# Hermes Agent Bootstrap Guide 🚀

> **Guia de Inicialização e Integração do Hermes Agent no Workspace Liquid v1**

---

## 1. Passo Zero: Subida do Contêiner Isolado (Host Fedora)

Inicie a sessão do agente apontando o volume **exclusivamente** para a pasta do produto:

```bash
cd $HOME/product_design/meuproduto
# Suba o herdr isolado para este workspace
```

---

## 2. Comando de Ativação do Hermes

No painel de controle do Hermes, envie o prompt inicial para ele assumir a governança do workspace:

```text
Este é um workspace Liquid v1 recém-inicializado. Leia todos os arquivos de governança na raiz (index.md, architecture.md, technical_agreement.md, product_vision.md) para assimilar o domínio deste produto. Confirme assim que estiver contextualizado para começarmos a delinear nossa primeira feature de negócio.
```

---

## 3. O Papel do Hermes no Ciclo de Vida do Produto

1. **Assimilação:** O Hermes lê os arquivos da raiz e memoriza os Bounded Contexts e as "Algemas da IA" de [`technical_agreement.md`](../technical_agreement.md).
2. **Proposta de Feature & Épico:** Quando você define uma nova funcionalidade, o Hermes sugere a criação de `features/[nome]/index.md` e os épicos necessários.
3. **Modelagem de Domínio (`plan.md`):** O Hermes propõe de forma autônoma o rascunho de `plan.md` com DDD puramente conceitual (Entidades, Invariantes, Eventos).
4. **Fatiamento em Tarefas (`tasks.md`):** Após sua aprovação, o Hermes gera a lista atômica de tarefas para execução.
5. **Supervisão e Auditoria:** O Hermes monitora o progresso do Claude/Executor e atualiza os arquivos `quick_status.md`.

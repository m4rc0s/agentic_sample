#!/usr/bin/env bash

# Scaffold Script for Spec-Driven Development (Liquid v1)
# Usage:
#   ./scripts/scaffold.sh feature <nome-da-feature>
#   ./scripts/scaffold.sh epic <nome-da-feature> <nome-do-epico>
#   ./scripts/scaffold.sh app <nome-da-app>

set -e

COMMAND="$1"
TARGET_NAME="$2"
SUB_TARGET="$3"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

show_help() {
    echo "Liquid SDD Scaffold CLI"
    echo ""
    echo "Uso:"
    echo "  ./scripts/scaffold.sh feature <nome-da-feature>             # Cria uma nova feature com templates"
    echo "  ./scripts/scaffold.sh epic <nome-da-feature> <nome-do-epico> # Cria um novo épico dentro de uma feature"
    echo "  ./scripts/scaffold.sh app <nome-da-app>                     # Cria uma nova aplicação em apps/ com app_liquid.md"
    echo ""
}

if [ -z "$COMMAND" ] || [ -z "$TARGET_NAME" ]; then
    show_help
    exit 1
fi

case "$COMMAND" in
    feature)
        FEAT_DIR="$BASE_DIR/features/$TARGET_NAME"
        if [ -d "$FEAT_DIR" ]; then
            echo "❌ Erro: Feature '$TARGET_NAME' já existe em features/$TARGET_NAME"
            exit 1
        fi

        echo "🚀 Criando feature '$TARGET_NAME'..."
        mkdir -p "$FEAT_DIR/epics"

        # Copiar arquivos de feature
        cp "$BASE_DIR/features/_template_feature/index.md" "$FEAT_DIR/index.md"
        cp "$BASE_DIR/features/_template_feature/feat_roadmap.md" "$FEAT_DIR/feat_roadmap.md"
        cp "$BASE_DIR/features/_template_feature/quick_status.md" "$FEAT_DIR/quick_status.md"
        
        # Ajustar placeholders básicos
        sed -i "s/\[Nome da Feature\]/$TARGET_NAME/g" "$FEAT_DIR/index.md" "$FEAT_DIR/feat_roadmap.md" "$FEAT_DIR/quick_status.md"

        # Copiar template de épico inicial
        cp -r "$BASE_DIR/features/_template_feature/epics/_template_epic" "$FEAT_DIR/epics/_template_epic"

        echo "✅ Feature '$TARGET_NAME' criada com sucesso em features/$TARGET_NAME"
        echo "👉 Próximo passo: edite $FEAT_DIR/index.md e defina o escopo de negócio."
        ;;

    epic)
        if [ -z "$SUB_TARGET" ]; then
            echo "❌ Erro: Nome do épico é obrigatório."
            echo "Uso: ./scripts/scaffold.sh epic <nome-da-feature> <nome-do-epico>"
            exit 1
        fi

        FEAT_DIR="$BASE_DIR/features/$TARGET_NAME"
        EPIC_DIR="$FEAT_DIR/epics/$SUB_TARGET"

        if [ ! -d "$FEAT_DIR" ]; then
            echo "❌ Erro: Feature '$TARGET_NAME' não encontrada em features/$TARGET_NAME"
            exit 1
        fi

        if [ -d "$EPIC_DIR" ]; then
            echo "❌ Erro: Épico '$SUB_TARGET' já existe em $EPIC_DIR"
            exit 1
        fi

        echo "🚀 Criando épico '$SUB_TARGET' na feature '$TARGET_NAME'..."
        mkdir -p "$EPIC_DIR"

        cp "$BASE_DIR/features/_template_feature/epics/_template_epic/index.md" "$EPIC_DIR/index.md"
        cp "$BASE_DIR/features/_template_feature/epics/_template_epic/plan.md" "$EPIC_DIR/plan.md"
        cp "$BASE_DIR/features/_template_feature/epics/_template_epic/tasks.md" "$EPIC_DIR/tasks.md"
        cp "$BASE_DIR/features/_template_feature/epics/_template_epic/quick_status.md" "$EPIC_DIR/quick_status.md"
        cp "$BASE_DIR/features/_template_feature/epics/_template_epic/epic_roadmap.md" "$EPIC_DIR/epic_roadmap.md"

        sed -i "s/\[Nome do Épico\]/$SUB_TARGET/g" "$EPIC_DIR/index.md" "$EPIC_DIR/plan.md" "$EPIC_DIR/tasks.md" "$EPIC_DIR/quick_status.md" "$EPIC_DIR/epic_roadmap.md"

        echo "✅ Épico '$SUB_TARGET' criado com sucesso em features/$TARGET_NAME/epics/$SUB_TARGET"
        echo "👉 Próximo passo: edite $EPIC_DIR/index.md e peça ao Hermes para propor o plan.md."
        ;;

    app)
        APP_DIR="$BASE_DIR/apps/$TARGET_NAME"
        if [ -d "$APP_DIR" ]; then
            echo "❌ Erro: Aplicação '$TARGET_NAME' já existe em apps/$TARGET_NAME"
            exit 1
        fi

        echo "🚀 Criando aplicação '$TARGET_NAME' em apps/..."
        mkdir -p "$APP_DIR"

        cp "$BASE_DIR/apps/_template_app/app_liquid.md" "$APP_DIR/app_liquid.md"
        sed -i "s/\[Nome da Aplicação\]/$TARGET_NAME/g" "$APP_DIR/app_liquid.md"
        sed -i "s/\[nome_da_aplicacao\]/$TARGET_NAME/g" "$APP_DIR/app_liquid.md"

        echo "✅ Aplicação '$TARGET_NAME' inicializada em apps/$TARGET_NAME com app_liquid.md"
        echo "👉 Próximo passo: configure a stack homologada em $APP_DIR/app_liquid.md."
        ;;

    *)
        echo "❌ Comando inválido: '$COMMAND'"
        show_help
        exit 1
        ;;
esac

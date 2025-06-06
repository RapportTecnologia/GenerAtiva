#!/bin/bash

# Define o caminho para o diretório de backend
BACKEND_DIR="/home/carlosdelfino/workspace/pesquisas/open-webui/backend"

# Ativa o ambiente virtual Python
source "$BACKEND_DIR/.venv/bin/activate"

# Verifica se o ambiente virtual foi ativado corretamente
if [[ "$(which python)" != *".venv/bin"* ]]; then
    echo "Erro: Falha ao ativar o ambiente virtual Python."
    exit 1
fi

# Exporta variáveis de ambiente necessárias
export PYTHONPATH="$BACKEND_DIR:$PYTHONPATH"

# Executa o script start.sh com o Python do ambiente virtual
bash -c "cd $BACKEND_DIR && python -m uvicorn open_webui.main:app --host 0.0.0.0 --port 8080 --forwarded-allow-ips '*' --workers 1"

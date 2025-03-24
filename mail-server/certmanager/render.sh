#!/bin/bash

# 取得當前這個腳本的目錄
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 匯入 .env 變數
export $(cat "$DIR/.env" | xargs)

# 執行 envsubst，讀取 template，輸出到實際 YAML
envsubst < "$DIR/clusterissuer-godaddy.yaml.template" > "$DIR/clusterissuer-godaddy.yaml"

echo "✅ 渲染完成：$DIR/clusterissuer-godaddy.yaml"

#!/bin/bash

# مسیر اسکریپت فعلی
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PORT=${1:-443}
CUSTOM_TAG=${2:-b0cbcef5a486d9636482ac27f8e46a9d}
TELEGRAM_TAG=$3
TLS_DOMAIN=${4:-s3.amazonaws.com}

if [[ -z "$TELEGRAM_TAG" ]]; then
    echo "❗ لطفاً تگ تلگرام را وارد کن." >&2
    exit 1
fi

# اجرای mtp_install.sh از همسایگی
bash "$SCRIPT_DIR/mtp_install.sh" -p "$PORT" -s "$CUSTOM_TAG" -t "$TELEGRAM_TAG" -a dd -a tls -d "$TLS_DOMAIN"

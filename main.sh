#!/bin/bash

# مسیر اسکریپت فعلی

PORT=${1:-443}
CUSTOM_TAG=${2:-b0cbcef5a486d9636482ac27f8e46a9d}
TELEGRAM_TAG=$3
TLS_DOMAIN=${4:-s3.amazonaws.com}

if [[ -z "$TELEGRAM_TAG" ]]; then
    echo "❗ لطفاً تگ تلگرام را وارد کن." >&2
    exit 1
fi

bash mtp_install.bash -p "$PORT" -s "$CUSTOM_TAG" -t "$TELEGRAM_TAG" -a dd -a tls -d "$TLS_DOMAIN"
#<(curl -s https://raw.githubusercontent.com/alirezkarami/ptel/main/mtp_install.bash)

#bash <(curl -s https://raw.githubusercontent.com/alirezkarami/ptel/main/mtp_install.bash) -p "443" -s "b0cbcef5a486d9636482ac27f8e46a9d" -t "c9fd7cf84432f94027f938b3465e33be" -a dd -a tls -d "s3.amazonaws.com"

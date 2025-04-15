#!/bin/bash

# --- دریافت ورودی‌ها با مقدار پیش‌فرض ---
PORT=443
CUSTOM_TAG="b0cbcef5a486d9636482ac27f8e46a9d"
TLS_DOMAIN="s3.amazonaws.com"
TELEGRAM_TAG=""

# --- پردازش آرگومان‌ها ---
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--port) PORT="$2"; shift ;;
        -c|--custom-tag) CUSTOM_TAG="$2"; shift ;;
        -t|--telegram-tag) TELEGRAM_TAG="$2"; shift ;;
        -d|--tls-domain) TLS_DOMAIN="$2"; shift ;;
        *) echo "❌ آرگومان نامعتبر: $1"; exit 1 ;;
    esac
    shift
done

# --- بررسی الزامی بودن تگ تلگرام ---
if [[ -z "$TELEGRAM_TAG" ]]; then
    echo "❗ لطفاً تگ بات تلگرام را با -t یا --telegram-tag وارد کن."
    exit 1
fi

# --- اجرای دستور اصلی ---
echo "🚀 اجرای نصب با:"
echo "پورت: $PORT"
echo "دلخواه تگ: $CUSTOM_TAG"
echo "تگ تلگرام: $TELEGRAM_TAG"
echo "TLS: $TLS_DOMAIN"

curl -L -o mtp_install.sh https://raw.githubusercontent.com/alirezkarami/ptel/main/p.bash && \
bash mtp_install.sh -p "$PORT" -s "$CUSTOM_TAG" -t "$TELEGRAM_TAG" -a dd -a tls -d "$TLS_DOMAIN"

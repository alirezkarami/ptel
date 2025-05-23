#!/bin/bash

# سوال از کاربر و استفاده از مقادیر پیش‌فرض در صورت وارد نکردن
echo "پورت (پیش‌فرض 443):"
read PORT
PORT=${PORT:-443}

echo "تگ سفارشی (پیش‌فرض b0cbcef5a486d9636482ac27f8e46a9d):"
read CUSTOM_TAG
CUSTOM_TAG=${CUSTOM_TAG:-b0cbcef5a486d9636482ac27f8e46a9d}

echo "تگ تلگرام:"
read TELEGRAM_TAG

echo "دامین TLS (پیش‌فرض s3.amazonaws.com):"
read TLS_DOMAIN
TLS_DOMAIN=${TLS_DOMAIN:-s3.amazonaws.com}

# بررسی اینکه تگ تلگرام وارد شده یا نه
if [[ -z "$TELEGRAM_TAG" ]]; then
    echo "❗ لطفاً تگ تلگرام را وارد کن." >&2
    exit 1
fi

bash <(curl -s https://raw.githubusercontent.com/alirezkarami/ptel/main/mtp_install.bash) -p "$PORT" -s "$CUSTOM_TAG" -t "$TELEGRAM_TAG" -a dd -a tls -d "$TLS_DOMAIN"

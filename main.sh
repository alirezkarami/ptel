# #!/bin/bash

# PORT=${1:-443}
# CUSTOM_TAG=${2:-b0cbcef5a486d9636482ac27f8e46a9d}
# TELEGRAM_TAG=$3
# TLS_DOMAIN=${4:-s3.amazonaws.com}

# if [[ -z "$TELEGRAM_TAG" ]]; then
#     echo "❗ لطفاً تگ تلگرام را وارد کن." >&2
#     exit 1
# fi

# bash <(curl -s https://raw.githubusercontent.com/alirezkarami/ptel/main/mtp_install.bash) -p "$PORT" -s "$CUSTOM_TAG" -t "$TELEGRAM_TAG" -a dd -a tls -d "$TLS_DOMAIN"

# #<(curl -s https://raw.githubusercontent.com/alirezkarami/ptel/main/mtp_install.bash)

# bash <(curl -s https://raw.githubusercontent.com/alirezkarami/ptel/main/main.sh) "" "" "c9fd7cf84432f94027f938b3465e33be" ""

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
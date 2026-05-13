#!/bin/bash

# تحقق من أن الملف موجود
if [ -z "$1" ]; then
  echo "Usage: $0 <image_path>"
  exit 1
fi

FILE="$1"
# s5WVhGoTLYeZgyN9GML3lKie9rzRWbyAfh3XO2RjKsk=
API_KEY=""  # ضع مفتاحك هنا

# رفع الصورة إلى ImgBB
URL=$(curl --silent --location --request POST "https://api.imgbb.com/1/upload?expiration=600&key=$API_KEY" \
--form "image=@$FILE" | jq -r '.data.url_viewer')

# نسخ الرابط للحافظة
echo -n "$URL" | xclip -selection clipboard

# إشعار بنجاح العملية
notify-send "ImgBB Upload" "تم رفع الصورة! الرابط جاهز في الحافظة."

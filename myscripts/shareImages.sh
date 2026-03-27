#!/bin/bash
API_KEY=""
ALL_URLS=""
for FILE in "$@"
do
    if [[ -f "$FILE" ]]; then
        RESPONSE=$(curl -s --location "https://api.imgbb.com/1/upload?key=${API_KEY}" \
            --form "image=@${FILE}")
        URL=$(echo $RESPONSE | awk '{ print $8 }')
        ALL_URLS+="$URL\n"
    fi
done
echo -e "$ALL_URLS" | xclip -selection clipboard
notify-send "تم رفع الصور" "تم نسخ جميع الروابط للحافظة"

#!/bin/bash

MODE="$1"
FILE="/tmp/shot_$(date +%Y-%m-%d_%H-%M-%S).png"
API_KEY=""
# تحديد نوع التصوير
if [ "$MODE" = "full" ]; then
    maim "$FILE"
elif [ "$MODE" = "area" ]; then
    maim -s "$FILE"
else
    echo "Usage: $0 [full|area]"
    exit 1
fi

# التأكد من وجود الصورة
[ ! -f "$FILE" ] && exit

# نافذة معاينة + تأكيد باستخدام yad
yad --title="معاينة الصورة" \
    --image="$FILE" \
    --text="هل تريد رفع الصورة؟" \
    --button=نعم:0 \
    --button=إعادة_التقاط:2 \
    --button=إلغاء:1

RESPONSE=$?

if [ "$RESPONSE" -eq 0 ]; then
URL=$(curl -s --location "https://api.imgbb.com/1/upload?key=${API_KEY}" \
        --form "image=@${FILE}" | jq -r '.data.url')

echo -n "$URL" | xclip -selection clipboard

notify-send "تم الرفع" "$URL"

elif [ "$RESPONSE" -eq 2 ]; then
    rm "$FILE"
    exec "$0" "$MODE"   # إعادة تشغيل السكربت بنفس الوضع

else
    rm "$FILE"
    notify-send "تم الإلغاء" "لم يتم رفع الصورة"
fi

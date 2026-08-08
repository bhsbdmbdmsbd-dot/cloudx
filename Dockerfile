FROM teddysun/xray:latest

# أنشئ المجلد المطلوب
RUN mkdir -p /etc/xray

# انسخ ملف الإعدادات
COPY config.json /etc/xray/config.json

# المنفذ
EXPOSE 8080

# تشغيل Xray مباشرة (بدون entrypoint)
CMD ["xray", "-config", "/etc/xray/config.json"]

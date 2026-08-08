FROM alpine:latest
RUN apk add --no-cache ca-certificates curl unzip envsubst
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/bin/ && \
    chmod +x /usr/bin/xray
COPY config.json /etc/xray/config.json
EXPOSE 8080
CMD sed -i "s/8080/${PORT:-8080}/g" /etc/xray/config.json && xray -config /etc/xray/config.json


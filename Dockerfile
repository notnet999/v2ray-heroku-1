FROM alpine:3.6

ENV VER=4.39.2
ENV PORT=8080
ENV DOMAIN=
ENV UUID=a6176281-159e-4741-950a-36d2a4ff4b32

RUN apk add --no-cache curl \
  && cd /root && mkdir /v2ray \
  && curl -OsL https://github.com/v2fly/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
  && unzip v2ray-linux-64.zip -d /v2ray \
  && cd /v2ray && chmod a+x v2ray v2ctl \
  && rm -rf /root/v2ray-linux-64.zip
 
COPY entrypoint.sh /root/
RUN chmod a+x /root/entrypoint.sh

CMD exec /root/entrypoint.sh


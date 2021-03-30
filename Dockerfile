FROM alpine:3.11
# ⬆ v3.12 causes "Illegal instruction" error when running ffmpeg on ARMv6

RUN apk add \
	nginx~=1.16 \
	nginx-mod-rtmp~=1.16
RUN mkdir -p /run/nginx/hls/ && \
	ln -sf /dev/stderr /var/log/nginx/error.log

RUN apk add ffmpeg~=4.2

COPY ./etc/nginx/ /etc/nginx/
COPY ./root/ /root/
RUN chmod +x /root/entrypoint.sh

ENTRYPOINT [ "/root/entrypoint.sh" ]

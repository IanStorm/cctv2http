FROM alpine:3.12

RUN apk add \
	nginx~=1.18 \
	nginx-mod-rtmp~=1.18
RUN mkdir -p /run/nginx/hls/ && \
	ln -sf /dev/stderr /var/log/nginx/error.log

RUN apk add ffmpeg~=4.3

COPY ./etc/nginx/ /etc/nginx/
COPY ./root /

ENTRYPOINT [ "/entrypoint.sh" ]

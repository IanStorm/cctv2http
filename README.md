# CCTV to HTTP

[![GitHub Actions](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FIanStorm%2Fcctv2http%2Fbadge%3Fref%3Dmain&style=flat&label=build&logo=none)](https://actions-badge.atrox.dev/IanStorm/cctv2http/goto?ref=main)
[![Docker Pulls](https://img.shields.io/docker/pulls/ianstorm/cctv2http)](https://hub.docker.com/r/ianstorm/cctv2http)
[![Docker Stars](https://img.shields.io/docker/stars/ianstorm/cctv2http)](https://hub.docker.com/r/ianstorm/cctv2http)

Provides browser-ready access to a live CCTV feed.
Lighweight design to fit on small hardware.

**🐳 Make sure you have installed *Docker*.**


## How to use in "production"? 👨‍💼 👩‍💼

1. Follow ["How to get a pre-built Docker image?"](#-how-to-get-a-pre-built-docker-image-☁️)
2. Start a Docker instance:
```
$	docker run \
		--rm \
		-t \
		--device=/dev/video0 \
		-p 80:80 \
		ianstorm/cctv2http:latest
```
3. The (HLS) live stream is available via `http://127.0.0.1/live.m3u8`.


## How to develop? 👨‍💻 👩‍💻

Make sure to have installed *Visual Studio Code*.

1. Clonse this repository, open the cloned folder in vscode.
2. Install the *recommended extensions*.
3. Update `root/entrypoint.sh` to use a dummy RSTP stream: Replace `-f <something> -i <something> \` by:
```
	-stream_loop -1 \
	-rtsp_transport tcp \
	-i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov \
```
4. Build & start a Docker instance: Run the vscode task `run`.
5. The (HLS) live stream is available via `http://127.0.0.1:8080/live.m3u8`.


## Appendix


### How to get a pre-built Docker image? ☁️

Get the latest Docker image from Docker Hub:
```
$	docker pull ianstorm/cctv2http:latest
```


### Sources 📙

* [Setting up HLS live streaming server using NGINX](https://docs.peer5.com/guides/setting-up-hls-live-streaming-server-using-nginx/)
* [GitHub: arut/nginx-rtmp-module](https://github.com/arut/nginx-rtmp-module)
* [Transcode to HLS live stream](https://stackoverflow.com/a/20526064)


### Alternatives

* [GH mpromonet/v4l2rtspserver](https://github.com/mpromonet/v4l2rtspserver), if HLS feature would work
* [GH Roverr/rtsp-stream](https://github.com/Roverr/rtsp-stream), if Docker image was available for ARM
* [GH ccrisan/motioneyeos](https://github.com/ccrisan/motioneyeos)

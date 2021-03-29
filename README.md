# cam2http

**🐳 Make sure you have installed *Docker*.**


## How to use in "production"? 👨‍💼 👩‍💼

1. Follow ["How to get a pre-built Docker image?"](#-how-to-get-a-pre-built-docker-image-☁️)
2. Start a Docker instance:
```
$	docker run \
		--rm \
		-t \
		--device=/dev/video0 \
		-p 8080:8080 \
		ianstorm/cam2http:latest
```


## How to develop? 👨‍💻 👩‍💻

...TODO:...


## Appendix


### How to get a pre-built Docker image? ☁️

Get the latest Docker image from Docker Hub:
```
$	docker pull ianstorm/cam2http:latest
```


### Sources

* [Setting up HLS live streaming server using NGINX](https://docs.peer5.com/guides/setting-up-hls-live-streaming-server-using-nginx/)
* [GitHub: arut/nginx-rtmp-module](https://github.com/arut/nginx-rtmp-module)
* [Transcode to HLS live stream](https://stackoverflow.com/a/20526064)


### Alternatives

* [GH mpromonet/v4l2rtspserver](https://github.com/mpromonet/v4l2rtspserver), if HLS feature would work
* [GH Roverr/rtsp-stream](https://github.com/Roverr/rtsp-stream), if Docker image was available for ARM

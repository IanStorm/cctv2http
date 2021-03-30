#!/bin/sh

nginx

ffmpeg \
	-i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov \
	-fflags nobuffer \
	-filter:v fps=2 \
	-vcodec libx264 -vprofile baseline \
	-an \
	-strict -2 \
	-f flv rtmp://127.0.0.1/push-hls/live
# 	-fflags nobuffer => reduce latency
# 	-filter:v => drop frames
# 	-an => remove audio

#!/bin/sh

nginx

ffmpeg \
	-f video4linux2 -i /dev/video0 \
	-fflags nobuffer \
	-vcodec libx264 -vprofile baseline \
	-an \
	-strict -2 \
	-f flv rtmp://127.0.0.1/push-hls/live
# 	-fflags nobuffer :: reduce latency
# 	-an :: remove audio

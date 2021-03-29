#!/bin/sh

nginx

ffmpeg \
	-re \
	-i /dev/video0 \
	-vcodec libx264 -vprofile baseline \
	-acodec aac \
	-strict -2 \
	-f flv rtmp://127.0.0.1/show/stream
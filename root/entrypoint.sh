#!/bin/sh

nginx

ffmpeg \
	-i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov \
	-fflags nobuffer \
	-vcodec libx264 \
		-vf \
			"fps=fps=2, \
			 scale=1280:720" \
	-an \
	-strict -2 \
	-f flv rtmp://127.0.0.1/push-hls/live
# 	-fflags nobuffer => reduce latency
# 	-vcodec => output H.264
# 		-vf fps => drop frames
# 		-vf scale => scale output
# 	-an => remove audio

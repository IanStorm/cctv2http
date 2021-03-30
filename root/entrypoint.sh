#!/bin/sh

nginx

ffmpeg \
	-stream_loop -1 \
	-rtsp_transport tcp \
	-i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov \
	-vcodec libx264 \
		-movflags +faststart \
		-preset superfast \
		-tune zerolatency \
		-vf \
			"fps=fps=1, \
			 scale=-1:720" \
		-b:v 100k \
	-an \
	-f flv rtmp://127.0.0.1/push-hls/live
# 	-stream_loop => infinitely loop input stream
# 	-rtsp_transport => prefer/enforce TCP (over UDP)
# 	-vcodec => output H.264
# 		-movflags +faststart => recommended for browser env., see https://trac.ffmpeg.org/wiki/Encode/H.264
# 		-preset => reduce latency
# 		-tune => reduce latency
# 		-vf fps => drop frames
# 		-vf scale => scale output
# 		-b:v => limit bit rate
# 	-an => remove audio

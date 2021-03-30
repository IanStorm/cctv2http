#!/bin/sh

nginx

ffmpeg \
	-stream_loop -1 \
	-rtsp_transport tcp \
	-i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov \
	-fflags nobuffer \
	-vcodec libx264 \
		-movflags +faststart \
		-preset fast \
		-tune zerolatency \
		-vf \
			"fps=fps=2, \
			 scale=1280:720" \
	-an \
	-f flv rtmp://127.0.0.1/push-hls/live
# 	-stream_loop => infinitely loop input stream
# 	-rtsp_transport => prefer/enforce TCP (over UDP)
# 	-fflags nobuffer => reduce latency
# 	-vcodec => output H.264
# 		-movflags +faststart => recommended for browser env., see https://trac.ffmpeg.org/wiki/Encode/H.264
# 		-preset => reduce latency
# 		-tune => reduce latency
# 		-vf fps => drop frames
# 		-vf scale => scale output
# 	-an => remove audio

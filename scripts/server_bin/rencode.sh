#!/bin/bash

for i in `fdfind video.mp4`; do
    snap run ffmpeg -hide_banner -hwaccel cuda -hwaccel_output_format cuda -i "$i" -c:a copy -c:v h264_nvenc "${i}_shrink.mp4"
done

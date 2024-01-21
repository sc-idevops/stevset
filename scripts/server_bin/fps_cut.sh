#!/bin/bash

for i in `fdfind video.mp4`; do
  if [[ (( $(ffprobe -show_streams $i 2>&1 | grep fps | awk '{split($0,a,"fps")}END{print a[1]}' | awk '{print $NF}') > 30 )) ]]; then
    snap run ffmpeg -hide_banner -hwaccel cuda -hwaccel_output_format cuda -i "$i" -c:a copy -c:v h264_nvenc -filter:v fps=30 "${i}_30.mp4" && \
      rm "$i" ; mv "${i}_30.mp4" "$i"
  fi
  echo "no edit for $i"
done


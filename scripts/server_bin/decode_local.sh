#!/bin/bash
for i in `fdfind -d=1 --extension=mp4`; do
  snap run ffmpeg -hide_banner -hwaccel cuda -hwaccel_output_format cuda -i "$i" -c:a copy -c:v h264_nvenc "${i}_30.mp4" 
  #safe mode on
  #rm --verbose "$i" ; mv --verbose "${i}_30.mp4" "$i"
done

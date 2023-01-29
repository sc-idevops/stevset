#!/bin/bash
for i in *.gif; do
  ffmpeg -hide_banner -loglevel error -i "$i" -pix_fmt yuv420p -movflags faststart -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" "${i%.gif}.mp4"
done


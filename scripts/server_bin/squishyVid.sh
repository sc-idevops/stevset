#!/bin/bash
#for d in */; do
#  cd $d
  for i in *.mp4; do
      ffmpeg -hide_banner -i "$i" -c:v libvpx-vp9 -c:a libopus -crf 30 -row-mt 1 -cpu-used 2 "$i.mkv"
      trash "$i"
#      mv output.mkv "$i.mkv"
  done
#  cd ..
#done

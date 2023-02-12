#!/bin/bash
for d in */; do
  cd $d
  for i in *.mp4; do
    vid_format=$(mediainfo --Inform="Video;%Format%" "$i")
    #echo video format is $vid_format
    if [[ "$vid_format" != "HEVC" ]]; then
      ffmpeg -hide_banner -loglevel error -hwaccel cuda -i "$i" -vcodec libx265 -crf 26 -c:a copy -movflags +faststart -x265-params log-level=0 output.mp4
      trash "$i"
      mv output.mp4 "$i"
    fi
  done
  cd ..
done

#!/bin/bash
#this script assumes its being run in the working directory

#test to see if its already been encoded to av1 or else it converts it
rate=30
format=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 "$1")
output_file="${1}_converted.mkv"
echo -e "\033[0;36m >> Height of file $1 is  ---> $format \033[0m"

if [ "$format" -gt 720 ]; then
  docker run --rm --device=/dev/dri:/dev/dri -v "$(pwd)":/config linuxserver/ffmpeg \
    -hide_banner \
    -hwaccel qsv -hwaccel_output_format qsv -qsv_device /dev/dri/renderD128 \
    -n \
    -i "/config/$1" \
    -vf "scale_qsv=-1:720" \
    -c:v av1_qsv \
    -look_ahead 1 -look_ahead_depth 100 \
    -global_quality $rate \
    -preset 4 \
    -g 150 \
    -c:a copy \
    "/config/$output_file" #    -hide_banner -loglevel warning -v quiet -stats \
fi

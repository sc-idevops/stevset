#!/bin/bash
#this script assumes its being run in the working directory

#test to see if its already been encoded to av1 or else it converts it
format=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 "$1")
rate=26
echo -e "\033[0;36m >> Format of file $1 is  ---> $format \033[0m"

if [ "$format" != "av1" ]; then
  docker run --rm --device=/dev/dri:/dev/dri -v "$(pwd)":/config linuxserver/ffmpeg \
    -hide_banner -stats \
    -i "/config/$1" \
    -map 0 \
    -c:v av1_qsv \
    -look_ahead_depth 100 \
    -tile_cols 1 \
    -global_quality $rate \
    -preset 4 \
    -g 150 \
    -c:a aac \
    -c:s copy \
    -c:d copy \
    "/config/${1%.*}_converted.mkv"
fi

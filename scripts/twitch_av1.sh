#!/bin/bash
#this script assumes its being run in the working directory

#test to see if its already been encoded to av1 or else it converts it
format=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 $1)
rate=29
echo "Format of file $1 is  ---> $format"

if [ "$format" != "av1" ]
then
  docker run -it --rm --device=/dev/dri:/dev/dri -v "$(pwd)":/config linuxserver/ffmpeg \
    -hide_banner -loglevel warning -v quiet -stats \
    -hwaccel qsv -hwaccel_output_format qsv -qsv_device /dev/dri/renderD128 \
    -i "/config/$1" \
    -n \
    -c:v av1_qsv \
    -global_quality $rate \
    -preset 4 \
    -g 150 \
    -c:a aac \
    -movflags faststart \
    "/config/${1}_converted.mp4"
fi

#!/bin/bash
#this script assumes its being run in the working directory

#test to see if its already been encoded to av1 or else it converts it
format=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 $1)

if [ "$format" != "av1" ]
then
  docker run -it --device=/dev/dri:/dev/dri -v "$(pwd)":/config linuxserver/ffmpeg \
    -i "/config/$1" \
    -vaapi_device /dev/dri/renderD128 \
    -c:v av1_qsv \
    -b:v 8M \
    -c:a aac \
    -movflags faststart \
    "/config/${1}_converted.mp4"
fi

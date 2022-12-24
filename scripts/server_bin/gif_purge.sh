#!/bin/bash
#Deletes all MP4's that are less than 4500ms long
#this could be refactored to take advantage of fd's parallel execution with -x
  #but should be limited with -j for number of threads 
fdfind -e mp4 | while read i; do
  length=$(mediainfo --Inform="Video;%Duration%" "$i")
  if [[ $length -le 4500 ]]; then
    rm "$i"
    #kioclient move $i "trash:/"
  fi
done
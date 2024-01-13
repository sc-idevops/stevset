#!/bin/bash
help()
{
  echo "Download all the past broadcasts from a twitch user"
  echo "Requires 2 Parameters:"
  echo "    -u the username of the twitch user"
  echo "    -f the encoding format for the videos, which are fed to yt-dlp"
}
while getopts u:f: flag
do
  case "${flag}" in
    u) username=${OPTARG};;
    f) format=${OPTARG};;
    h) help exit;;
  esac
done
if [[ -z "$2" ]]; then
  echo "please provide both parameters" 
  exit 1
fi

cd /home/stev/Videos/Twitch/$username || mkdir -v ~/Videos/Twitch/$username && cd ~/Videos/Twitch/$username
yt-dlp -q -f $format "https://www.twitch.tv/$username/videos?filter=archives&sort=time"


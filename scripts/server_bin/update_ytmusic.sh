#!/bin/bash
cd "/home/stev/Pictures/Music/Liked Music/"
yt-dlp --embed-metadata --parse-metadata "playlist_index:%(track_number)s" -x --audio-format mp3 --audio-quality 5 --embed-thumbnail --cookies-from-browser firefox --download-archive index.txt --break-on-existing 'https://music.youtube.com/playlist?list=LM'

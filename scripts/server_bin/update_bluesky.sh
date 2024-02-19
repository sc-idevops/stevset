#!/bin/bash
rm ~/bsky_error.txt
cd $HOME/gallery-dl/bluesky/
echo ">>>> Begin Downloads"
#gallery-dl --abort 3 -o retweets=true "https://twitter.com/stefenauris"
#gallery-dl --abort 3 -o retweets=true "https://twitter.com/DaybreakHero"
for i in */; do
  echo ">> $i"
  date
  gallery-dl --sleep 1-3 --abort 3 "https://bsky.app/profile/$i" || echo "$i" >> ~/bsky_error.txt
  echo "    << waiting"
  sleep 6
done

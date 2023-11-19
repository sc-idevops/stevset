#!/bin/bash
rm ~/twit_error.txt
cd $HOME/gallery-dl/twitter
echo ">>>> Begin Downloads"
gallery-dl --abort 3 -o retweets=true "https://twitter.com/stefenauris"
gallery-dl --abort 3 -o retweets=true "https://twitter.com/DaybreakHero"
for i in */; do
  echo ">> $i"
  date
  gallery-dl --sleep 6 --abort 3 "https://twitter.com/$i" || echo "$i" >> ~/twit_error.txt
  echo "    << waiting"
  sleep 60
done

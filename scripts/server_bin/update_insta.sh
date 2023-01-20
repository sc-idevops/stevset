#!/bin/bash
cd $HOME/gallery-dl/instagram
cat favorites.txt | while read line
do
  echo ">> $line"
  gallery-dl --sleep 8-14 --abort 3 "https://www.instagram.com/$line"
  sleep 30
done

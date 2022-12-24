#!/bin/bash
cd $HOME/gallery-dl/instagram
for i in */; do
  echo ">> $i"
  gallery-dl --sleep 8-14 --abort 3 "https://www.instagram.com/$i"
  sleep 30
done


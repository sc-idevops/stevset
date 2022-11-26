#!/bin/bash
cd $HOME/gallery-dl/instagram
for i in */; do
  echo ">> $i"
  gallery-dl --sleep 2-3 --abort 3 https://www.instagram.com/$i
  sleep 15
done


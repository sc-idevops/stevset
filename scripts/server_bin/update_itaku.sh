#!/bin/bash
cd $HOME/gallery-dl/itaku
for i in *; do
  echo ">> $i"
  gallery-dl --abort 3 --sleep 2 https://itaku.ee/profile/$i/gallery
  sleep 15
done


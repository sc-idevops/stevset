#!/bin/bash
N=2
cd $HOME/gallery-dl/furaffinity
gallery-dl --abort 3 --sleep 0-1 "https://www.furaffinity.net/favorites/stevo/"
for i in */; do
  echo ">> $i"
  (gallery-dl --abort 3 --sleep 0-1 https://www.furaffinity.net/user/$i || echo "$i" >> ~/fa_error.log) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi 
done
wait

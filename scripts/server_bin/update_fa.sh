#!/bin/bash
N=2
trash ~/fa_error.log 2>/dev/null
cd $HOME/gallery-dl/furaffinity

for i in */; do
  echo ">> $i"
  (gallery-dl --abort 3 --sleep 0-2 https://www.furaffinity.net/user/$i || echo "$i" >>~/fa_error.log) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi
done
wait
gallery-dl --abort 3 --sleep 0-2 "https://www.furaffinity.net/favorites/stevo/"
gallery-dl --abort 3 --sleep 0-2 "https://www.furaffinity.net/favorites/yrrufaton07/"
gallery-dl --abort 3 --sleep 0-2 "https://www.furaffinity.net/favorites/arandomguyontheinternet/"

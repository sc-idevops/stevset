#!/bin/bash
N=2
trash ~/fa_error.log 2>/dev/null
cd $HOME/gallery-dl/furaffinity

for i in */; do
  echo -e "\033[0;36m >> Downloading $i \033[0m"
  date
  (gallery-dl --abort 5 --sleep 1-3 https://www.furaffinity.net/user/$i || echo "$i" >>~/fa_error.log) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi
done
wait

echo -e "\033[0;36m >> Downloading Favorites \033[0m"
gallery-dl --abort 3 --sleep 1-3 "https://www.furaffinity.net/favorites/stevo/"
gallery-dl --abort 3 --sleep 1-3 "https://www.furaffinity.net/favorites/yrrufaton07/"
gallery-dl --abort 3 --sleep 1-3 "https://www.furaffinity.net/favorites/arandomguyontheinternet/"

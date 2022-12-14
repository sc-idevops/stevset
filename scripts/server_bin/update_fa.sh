#!/bin/bash
N=2
cd $HOME/gallery-dl/furaffinity
for i in */; do
  echo ">> $i"
  (gallery-dl --abort 3 --sleep 0-1 https://www.furaffinity.net/user/$i) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi 
done
wait

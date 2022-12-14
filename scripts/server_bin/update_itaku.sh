#!/bin/bash
N=2
cd $HOME/gallery-dl/itaku
for i in *; do
  echo ">> $i"
  (gallery-dl --abort 3 --sleep 2 https://itaku.ee/profile/$i/gallery) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi 
done


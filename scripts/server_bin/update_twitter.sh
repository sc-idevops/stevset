#!/bin/bash
N=4
cd $HOME/gallery-dl/twitter
for i in */; do
  echo ">> $i"
  (gallery-dl --sleep 0-1 --abort 3 "https://twitter.com/$i" || echo "Problem with gallery at https://twitter.com/$i" >> ~/twit_error.txt) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi 
done
echo ">>> Updating Retweets"
gallery-dl --abort 3 --sleep 0-1 -o retweets=true "https://twitter.com/stefenauris"
gallery-dl --abort 3 --sleep 0-1 -o retweets=true "https://twitter.com/DaybreakHero"
wait

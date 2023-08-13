#!/bin/bash
N=1
rm ~/twit_error.txt
cd $HOME/gallery-dl/twitter
echo ">>> Begin Downloads"
for i in */; do
  echo ">> $i"
  (gallery-dl --sleep 3 --abort 3 "https://twitter.com/$i" || echo "$i" >> ~/twit_error.txt) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi 
done
echo ">>> Updating Retweets"
gallery-dl --abort 3 --sleep 2 -o retweets=true "https://twitter.com/stefenauris"
gallery-dl --abort 3 --sleep 2 -o retweets=true "https://twitter.com/DaybreakHero"
wait

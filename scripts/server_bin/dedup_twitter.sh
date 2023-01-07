#!/bin/bash
N=6
df > ~/before_df.txt
cd $HOME/gallery-dl/twitter
for i in */; do
  echo ">> $i"
  (jdupes -LN $i) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi 
done
wait
echo "======COMPLETE======="
echo "Before:"
cat ~/before_df.txt
df

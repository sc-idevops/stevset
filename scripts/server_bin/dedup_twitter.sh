#!/bin/bash
N=6
before=$(df | grep -i picture)
cd $HOME/gallery-dl/twitter
for i in */; do
  echo ">> $i"
  (find -L "$i" -type l -delete) &
  (jdupes -LN $i) &
  if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
    wait -n
  fi 
done
wait
echo "======COMPLETE======="
echo "Before:" 
echo $before
echo "After:"
df | grep -i picture

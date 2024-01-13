#!/bin/bash
target=/home/stev/Pictures/gallery-dl/twitter/follow.txt
#edit follows file in place
sed -n -i '/^@/p' $target
sed -ie 's/^.//' $target
#loop through the list and download
for i in `cat $target`; do
  gallery-dl --sleep 4 --abort 3 "https://twitter.com/$i"
done


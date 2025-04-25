#!/bin/bash
target=/home/stev/Pictures/gallery-dl/bluesky/follow2.txt
#edit follows file in place
iconv -c -f utf-8 -t ascii /home/stev/Pictures/gallery-dl/bluesky/follow.txt > $target
sed -n -i '/^@/p' $target
sed -ie 's/^.//' $target
#check if list is valid
cat $target
read -e -p "is this list valid? " valid
if [[ "$valid"  == [Yy]* ]] 
#loop through the list and download
for i in `cat $target`; do
  gallery-dl --sleep 1-3 "https://bsky.app/profile/$i"
done
fi

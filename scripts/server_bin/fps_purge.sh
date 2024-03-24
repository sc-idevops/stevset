#!/bin/bash
for i in `fdfind _30.mp4`; do
  j=${i/_30.mp4/}
  rm --verbose "$j"
  mv --verbose "$i" "$j"
done

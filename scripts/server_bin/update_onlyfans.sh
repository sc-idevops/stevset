#!/bin/bash
# docker pull ghcr.io/datawhores/of-scraper:latest
test -t 1 && USE_TTY="-it" 
docker run ${USE_TTY} --rm --name=ofscraper -u 1000:1000 -v /home/stev/.config/ofscraper:/home/ofscraper/.config/ -v /home/stev/gallery-dl/onlyfans:/home/ofscraper/data \
  ghcr.io/datawhores/of-scraper:latest \
  ofscraper --output normal --action download --sort subscribed --post timeline,streams,messages,purchased -ts --username ALL

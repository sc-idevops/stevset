#!/bin/bash
# docker pull ghcr.io/datawhores/of-scraper:latest
docker run -it --rm --name=ofscraper -u 1000:1000 -v /home/stev/.config/ofscraper:/home/ofscraper/.config/ -v /home/stev/gallery-dl/onlyfans:/home/ofscraper/data \
  ghcr.io/datawhores/of-scraper:3.9.1 \
  ofscraper --output normal --action download --sort subscribed --post timeline,profile,messages,purchased -ts --username ALL

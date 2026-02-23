#!/bin/bash
docker pull ghcr.io/datawhores/of-scraper:latest

export OF_DYNAMIC_GENERIC_URL="https://raw.githubusercontent.com/rafa-9/dynamic-rules/main/rules.json"
#export OF_DEVIINT_URL=""
test -t 1 && USE_TTY="-it"

docker run ${USE_TTY} --rm --name=ofscraper --env-file /home/stev/.config/ofscraper/ofscraper/env \
  -v /home/stev/.config/ofscraper:/home/ofscraper/.config/ -v /home/stev/gallery-dl/onlyfans:/home/ofscraper/data \
  ghcr.io/datawhores/of-scraper:latest \
  ofscraper --output NORMAL --log NORMAL --action download --sort subscribed --post timeline,streams,messages,purchased -ts --username ALL

#!/bin/bash
docker run  -it --rm --name=ofscraper -u 1000:1000 -v /home/stev/.config/ofscraper:/home/ofscraper/.config/ -v /home/stev/gallery-dl/onlyfans:/home/ofscraper/data ghcr.io/datawhores/of-scraper:latest bash

#!/bin/bash
# pull backup from remote server
rsync -hav --progress --delete --compress yc:/home/stev/backup /home/stev/storage/yc-backup

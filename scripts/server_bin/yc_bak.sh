#!/bin/bash
rsync -hav --progress --delete --compress yc:/home/stev/backup /home/stev/storage/yc-backup

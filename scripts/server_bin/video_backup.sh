#!/bin/bash

#this script backup/syncs the video folder

sudo mkdir /mnt/vid_bak
#mount the drive
sudo mount /dev/disk/by-uuid/f9912d9f-7ce2-4a1a-ab8c-2206d431812c /mnt/vid_bak

#rsync 
sudo rsync --one-file-system --delete -havP --exclude *converted* --exclude .Trash* ~/Videos/ /mnt/vid_bak/Videos


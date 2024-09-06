#!/bin/bash
gallery-dl -u stefenauris.com -p `cat ~/.gallery-dl/bsky-secret.txt` --abort 6 --sleep 1-2 -o include=all -o reposts=true -o archive=~/gallery-dl/bluesky/stefenauris.com/likes.sqlite3 -o blacklist= -d ~/gallery-dl/bluesky/stefenauris.com/ "https://bsky.app/profile/stefenauris.com"

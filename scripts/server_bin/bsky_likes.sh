#!/bin/bash
gallery-dl -u steveokard@gmail.com -p `cat ~/.gallery-dl/bsky-secret.txt` --abort 3 --sleep 1-2 -o include=likes -o archive=~/gallery-dl/bluesky/stefenauris.com/archive.sqlite3 -d ~/gallery-dl/bluesky/stefenauris.com/ "https://bsky.app/profile/stefenauris.com"

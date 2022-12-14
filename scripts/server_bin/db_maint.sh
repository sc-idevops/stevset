#!/bin/bash
#vaccum the database
echo "--- DATABASE MAINTENANCE ---"
cd $HOME/gallery-dl
sqlite3 archive.sqlite3 'VACUUM;'
echo "--- MAINTENANCE COMPLETE ---"

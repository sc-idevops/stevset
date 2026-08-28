#!/bin/bash
#vaccum the database
echo "--- DATABASE MAINTENANCE ---"
cd $HOME/gallery-dl
ls -alh *.sqlite3
sqlite3 archive.sqlite3 'VACUUM;'
ls -alh *.sqlite3
echo "--- MAINTENANCE COMPLETE ---"

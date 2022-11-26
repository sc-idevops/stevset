#!/bin/bash
#systematically rescans all scsi hosts for change in drives
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
for i in /sys/class/scsi_host/*; do
  echo "- - -" | sudo tee > $i/scan
done

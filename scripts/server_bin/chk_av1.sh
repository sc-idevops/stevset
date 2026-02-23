#!/usr/bin/env bash
# Function: list non‑AV1 files
# Usage: ./check_av1.sh /path/to/search > non_av1.txt
# Requires: ffprobe (part of ffmpeg)

search_dir="${1:-.}"            # directory to scan (default: current)
output_file="${2:-non_av1.txt}" # file to store non‑AV1 names

# Ensure output file is empty
: >"$output_file"

# Recursively walk through all files
while IFS= read -r -d '' file; do
  # Try to get the video codec; suppress errors for non‑video files
  codec=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name \
    -of default=noprint_wrappers=1:nokey=1 "$file" 2>/dev/null)

  # If ffprobe didn't return a codec, the file is likely not a video → skip
  if [[ -z $codec ]]; then
    continue
  fi

  # Append filename if codec is not av1
  if [[ $codec != "av1" ]]; then
    echo "$file" >>"$output_file"
  fi
done < <(find "$search_dir" -type f -print0)

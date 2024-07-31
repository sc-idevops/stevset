#!/bin/bash
# https://forum.level1techs.com/t/ffmpeg-av1-encoding-using-intel-arc-gpu-tips/205120/2
ffmpeg \
  -extra_hw_frames 40 \
  -i "$1" \
  -init_hw_device vaapi=va:/dev/dri/renderD128 \
  -c:v av1_qsv \
  -preset veryslow \
  -extbrc 1 \
  -look_ahead_depth 40 \
  -b:v 1M \
  -bufsize 2M \
  -rc_init_occupancy 512K \
  -low_power 0 \
  -adaptive_i 1 \
  -adaptive_b 1 \
  -b_strategy 1 -bf 7 \
  "$2"

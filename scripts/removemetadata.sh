#!/bin/bash
B=$(echo "$1"| rev | cut -d"." -f1  | rev)
ffmpeg -hide_banner -i "$1" -map 0:v:0? -map 0:a? -map 0:s? -c copy -map_metadata:g -1 "output.${B}"

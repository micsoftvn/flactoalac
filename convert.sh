#!/bin/bash

input_dir="Tuyen tap nhac Hoa"
output_dir="Tuyen tap nhac Hoa-[ALAC]"

mkdir -p "$output_dir"

for flac_file in "$input_dir"/*.flac; do
    filename=$(basename -- "$flac_file")
    filename_noext="${filename%.*}"
    output_file="$output_dir/$filename_noext.m4a"

    ffmpeg -i "$flac_file" -acodec alac -vn "$output_file"
    echo "Converted: $filename"
done

echo "Conversion complete!"

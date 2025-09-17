#!/bin/bash
# -------------------------------------------------------------
# FFmpeg Metadata Editor - Colab Version
# Description: Automatically edits MKV metadata and audio tracks.
# Author: Your Name
# License: MIT
# -------------------------------------------------------------

# Enable nullglob to avoid errors if no MKV files are present
shopt -s nullglob

# Loop through all MKV files in current folder
for f in *.mkv; do
    echo "Processing: $f"

    # Remove file extension to get base name
    base="${f%.*}"

    # Detect season & episode (e.g., S01E05)
    if [[ "$base" =~ (S[0-9]{2})E[0-9]{2} ]]; then
        season="${BASH_REMATCH[1]}"
        ep="${BASH_REMATCH[0]}"
    else
        season="UnknownSeason"
        ep="$base"
    fi

    # Create season folder if it doesn't exist
    mkdir -p "$season"

    # Run FFmpeg to edit metadata and reorder audio tracks
    ffmpeg -i "$f" \
        -map_metadata -1 \
        -map 0:v:0 \
        -map 0:a:3 \
        -map 0:a:0 \
        -map 0:a:1 \
        -map 0:a:2 \
        -metadata title="$ep - Metadata Edited" \
        -metadata:s:v:0 title="Metadata Editor" \
        -disposition:a:0 default \
        -disposition:a:1 0 \
        -disposition:a:2 0 \
        -disposition:a:3 0 \
        -metadata:s:a:0 title="Metadata Editor" -metadata:s:a:0 language=tel \
        -metadata:s:a:1 title="Metadata Editor" -metadata:s:a:1 language=hin \
        -metadata:s:a:2 title="Metadata Editor" -metadata:s:a:2 language=eng \
        -metadata:s:a:3 title="Metadata Editor" -metadata:s:a:3 language=tam \
        -c copy "$season/$f"

done

echo "✅ All files processed → check the season folders"

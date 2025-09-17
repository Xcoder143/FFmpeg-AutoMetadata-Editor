# FFmpeg-AutoMetadata-Editor

# FFmpeg Metadata Editor

A simple Bash script to batch-edit MKV metadata using FFmpeg.  
Automatically organizes episodes by season, updates metadata titles, reorders audio tracks, and preserves original filenames.

---

## Features

- Auto-detect **season/episode** from filenames (e.g., `S01E05`)  
- Creates season folders automatically (`S01/`, `S02/`, …)  
- Updates **file title** (e.g., `S01E05 - Metadata Edited`)  
- Updates **video track title** (`Metadata Editor`)  
- Updates **all audio track titles** (`Metadata Editor`)  
- Reorders audio tracks: Telugu → Hindi → English → Tamil  
- Marks **Telugu** as the default audio track  
- Supports filenames with **spaces, braces, parentheses**  
- **No re-encoding** (`-c copy`) → very fast  

---

## Repository Structure


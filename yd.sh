#!/bin/bash
path=~/Downloads
today=$(date "+%Y%m%d")

# The process of download a youtube movie. The format num is for my environment.
youtube-dl -o ${path}/music_${today}.webm -f 251 $1
youtube-dl -o "${path}/movie_${today}_%(title)s-%(id)s.%(ext)s" -f 248 $1

echo $music
echo $movie
echo $title
ffmpeg -i "$music" -i "$movie" -c:v copy -c:a copy "${path}/${title}"
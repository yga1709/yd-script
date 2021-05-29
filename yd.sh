#!/bin/bash
path=~/Downloads
today=$(date "+%Y%m%d")

# The process of download a youtube movie. The format num is for my environment.
youtube-dl -o ${path}/music_${today}.webm -f 251 $1
youtube-dl -o "${path}/movie_${today}_%(title)s-%(id)s.%(ext)s" -f 248 $1

# Find the movie and music files you have just downloaded.
music=$(find ${path} -name "music_${today}.webm")
movie=$(find ${path} -name "movie_${today}*")
title=$(basename "$movie" | sed -e 's/movie_//g')

echo $music
echo $movie
echo $title

# Merging downloaded movie and audio. Finally, remove the files downloaded by this script.
ffmpeg -i "$music" -i "$movie" -c:v copy -c:a copy "${path}/${title}"

rm "$music"
rm "$movie"

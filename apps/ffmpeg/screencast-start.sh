#!/bin/bash

# MINIMAL FFMPEG SCREENCASTING START

# variables below

DATE=`date +%s`
OUTPUT="$HOME/Videos/Screencasts"
ICON="$HOME/.icons/screencasting.png"
SIZE="1920x1080"
RATE="30"

# script below

zenity --title="FFMPEG" --question --text="Begin Screencasting?" 

# pause!
sleep 1s

# check audio output!
if [ "cat /proc/asound/card*/pcm*/sub*/status | grep state | cut -c8-14" == "RUNNING" ]; then
  # record video and audio
	ffmpeg -f alsa -ac 2 -i pulse -f x11grab -s $SIZE -r $RATE -i :0.0 -movflags faststart -crf 20 -y "$OUTPUT/$DATE.mp4" | zenity --notification --window-icon="$ICON"
else
  # record video only
	ffmpeg -f x11grab -s $SIZE -r $RATE -i :0.0 -movflags faststart -crf 20 -y "$OUTPUT/$DATE.mp4" | zenity --notification --window-icon="$ICON"
fi

# pause!
sleep 1s

# open thunar to show video
thunar "$OUTPUT"


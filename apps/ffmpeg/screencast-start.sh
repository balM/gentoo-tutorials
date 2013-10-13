#!/bin/bash

# MINIMAL FFMPEG SCREENCASTING START

# variables below

DATE=`date +%s`
OUTPUT="$HOME/Videos/Screencasts"
ICON="$HOME/.icons/screencasting.png"
SIZE="1920x1080"
RATE="30"
VCODEC="libx264"
ACODEC="libfaac"
PIXELS="yuv420p"
PRESET="ultrafast"
VSYNC="vfr"

# script below

zenity --title="FFMPEG" --question --text="Begin Screencasting?" 

# pause!
sleep 1s

# screencast
ffmpeg -f alsa -ac 2 -i pulse -f x11grab -s $SIZE -r $RATE -i :0.0 -c:a $ACODEC -c:v $VCODEC -pix_fmt $PIXELS -preset $PRESET -vsync $VSYNC -movflags faststart -y "$OUTPUT/$DATE.mp4" | zenity --notification --window-icon="$ICON"

# pause!
sleep 1s

# open thunar to show video
thunar "$OUTPUT"

exit 0


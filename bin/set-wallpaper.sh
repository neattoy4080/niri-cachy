#!/bin/bash

if [[ -z "$1" || "$1" == "--help" || "$1" == "-h" || "$1" == "-help" ]]; then
    echo "Usage: set-wallpaper.sh /path/to/image"
    echo ""
    echo "Example:"
    echo "  set-wallpaper.sh ~/Pictures/cool-wallpaper.jpg"
    exit 0
fi

if [[ ! -f "$1" ]]; then
    echo "File does not exist at $1"
    exit 1
fi

magick $1 ~/.config/niri/wallpaper.jpg
magick ~/.config/niri/wallpaper.jpg -blur 0x10 ~/.config/niri/wallpaper-blur.jpg
swww img ~/.config/niri/wallpaper.jpg --transition-type=wave --transition-angle=30 --transition-duration=2
systemctl --user restart swaybg.service

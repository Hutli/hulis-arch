#!/bin/bash

pacman -S i3blocks

feh --bg-scale ./backgrounds/windows-xp-bliss.jpg
cp ../settings/.config/i3/config ~/.i3/config
cp ../settings/etc/i3blocks.conf /etc/i3blocks.conf

i3 reload

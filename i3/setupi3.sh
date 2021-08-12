#!/bin/bash

pacman -S i3blocks
pacaur -S pacman-contrib
pacaur -S sysstat

feh --bg-scale ./backgrounds/windows-xp-bliss.jpg

pacaur -S noto-fonts-emoji

cp ../settings/.config/i3/config ~/.i3/config
cp ../settings/etc/i3blocks.conf /etc/i3blocks.conf

i3 reload
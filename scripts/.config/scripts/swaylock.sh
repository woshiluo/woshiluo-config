#! /bin/bash
#
# swaylock.sh
# Copyright (C) 2021 Woshiluo Luo <woshiluo.luo@outlook.com>
#
# Distributed under terms of the GNU AGPLv3+ license.
#

wallpaper="/home/woshiluo/Pictures/Wallpaper/71849322_p0_glur.png"

if [ "$1" = 1 ]; then
	swayidle -w \
		timeout 5 'hyprctl dispatch dpms off' \
		resume 'hyprctl dispatch dpms on' &

	swaylock -i $wallpaper 

	kill %%
else
	swaylock -f -i $wallpaper 
fi

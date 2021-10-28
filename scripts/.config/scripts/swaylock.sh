#! /bin/sh
#
# swaylock.sh
# Copyright (C) 2021 Woshiluo Luo <woshiluo.luo@outlook.com>
#
# Distributed under terms of the GNU AGPLv3+ license.
#

wallpaper="/home/woshiluo/Pictures/Wallpaper/71849322_p0_glur.png"

if [ $1 -eq 1 ]; then
	swayidle -w \
		timeout 5 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' &

	swaylock -i $wallpaper 

	kill %%
else
	swaylock -f -i $wallpaper 
fi

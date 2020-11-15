#!/bin/bash 

status=`playerctl status`

if [ $status == "Paused" ]; then
	playerctl play
else
	playerctl pause
fi

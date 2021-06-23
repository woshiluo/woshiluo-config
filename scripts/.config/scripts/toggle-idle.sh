#!/bin/bash

if [ $( systemctl --user is-active swayidle | grep inactive | wc -l ) -eq 1 ]; then
	notify-send "Start Swayidle"
	systemctl --user start swayidle
else
	notify-send "Stop Swayidle"
	systemctl --user stop swayidle
fi

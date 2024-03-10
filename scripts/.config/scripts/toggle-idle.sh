#!/bin/bash

if [ $( systemctl --user is-active hypridle | grep inactive | wc -l ) -eq 1 ]; then
	notify-send "Start hypridle"
	systemctl --user start hypridle
else
	notify-send "Stop hypridle"
	systemctl --user stop hypridle
fi

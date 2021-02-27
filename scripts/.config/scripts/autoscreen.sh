#/bin/bash

while true; do
	if [ $( swaymsg -r -t get_outputs | jq -r ".[]" --indent 0 | wc -l ) -ge 2 ]; then
		echo "More outputs"
		swaymsg "output eDP-1 disable" >/dev/null 2>&1
	else 
		echo "One output"
		swaymsg "output eDP-1 enable" >/dev/null 2>&1
	fi
	sleep 5
done

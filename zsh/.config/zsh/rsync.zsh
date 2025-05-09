#!/bin/zsh

function rsync_cp() {
	# Source: https://wiki.archlinux.org/index.php/Rsync
	
	new_args=();

	for i in "$@"; do
		case $i in /) i=/;; */) i=${i%/};; esac
		new_args+=$i;
	done
	rsync "${(@)new_args}"
}

function cpr() {
	rsync_cp --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
} 
function mvr() {
	rsync_cp --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}

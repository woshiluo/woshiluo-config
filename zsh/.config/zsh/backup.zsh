#!/bin/zsh

function backup_send() {
	ulimit -s unlimited
	sudo btrfs send "$1" | zstd --ultra --adapt -T0 - | gpg --sign --encrypt -r A2AA7A2471928C3244077AA542AC62C614601460 --compress-algo Uncompressed | ssh woshiluo@192.168.0.6 "ulimit -s unlimited; cat - > /home/woshiluo/$2"
}

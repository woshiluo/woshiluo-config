#!/bin/zsh
# Author: woshiluo<woshiluo.luo [at] outlook.com>
# Website: https://woshiluo.com
# LICENSE: AGPL 3.0+

function proxy_off() {
	echo "proxy off";
	unset http_proxy;
	unset https_proxy;
	unset ftp_proxy;
	unset rsync_proxy;
	unset all_proxy;
}

function proxy_on() {
	if [ -z $2 ]; then
		proxy_address=127.0.0.1
	else
		proxy_address=$2
	fi
	if [ -z $1 ]; then
		proxy_port=8118
	else
		proxy_port=$1
	fi

	echo "proxy $proxy_address:$proxy_port";
	export all_proxy="http://$proxy_address:$proxy_port";
	export http_proxy=$all_proxy;
	export https_proxy=$all_proxy;
	export ftp_proxy=$all_proxy;
	export rsync_proxy=$all_proxy;
}

alias pon=proxy_on
alias poff=proxy_off

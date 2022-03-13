#!/bin/zsh

echo "test" > "/run/wait-online-rs/204.cond"

export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"

wget https://github.com/out0fmemory/qqwry.dat/raw/master/qqwry_lastest.dat -O /tmp/qqwry.dat

size=`wc -c < /tmp/qqwry.dat`

echo $size

if [ $size -ne 0 ]; then
	mv /tmp/qqwry.dat ~/.config/nali-cli/qqwry.dat
fi

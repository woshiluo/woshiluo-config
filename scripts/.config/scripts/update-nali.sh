#!/bin/zsh

export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"
wget https://github.com/out0fmemory/qqwry.dat/raw/master/qqwry_lastest.dat -O ~/.config/nali-cli/qqwry.dat

#! /bin/sh
#
# rime-sync.sh
# Copyright (C) 2021 Woshiluo Luo <woshiluo.luo@outlook.com>
#
# Distributed under terms of the GNU AGPLv3+ license.
#


cd /home/woshiluo/.local/share/fcitx5/rime

fd --hidden | grep temp | xargs rm -rf
fd --hidden | grep LOCK | xargs rm -rf

rime_dict_manager -s

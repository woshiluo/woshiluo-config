#! /bin/sh
#
# md2pdf.sh
# Copyright (C) 2021 Woshiluo Luo <woshiluo.luo@outlook.com>
#
# Distributed under terms of the GNU AGPLv3+ license.
#

origin=$1
output=$2

pandoc --pdf-engine=tectonic -V CJKmainfont="LXGW WenKai" -V geometry:margin=1in $origin -o $output

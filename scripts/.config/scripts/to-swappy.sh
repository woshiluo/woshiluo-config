#!/bin/bash

file_name=$1

swappy -f - -o - | pngquant --quality 80-100 - -o $file_name

#!/bin/bash

file_name=$1

swappy -f - -o - | pngquant - -o $file_name

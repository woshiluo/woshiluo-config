#!/bin/bash

file_name=$1

swappy -f - -o - | convert - $file_name

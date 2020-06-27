#!/bin/zsh

export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"

source ~/.zshrc
zinit update --all
zinit module build

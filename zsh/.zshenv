# Alias
alias ls="lsd"
alias find="fd"
alias cat="bat"
alias grep="rg"
alias htop="htop -t"
alias zinit='http_proxy="http://127.0.0.1:8118" https_proxy="http://127.0.0.1:8118" zinit'
alias mutt='neomutt'
alias fzf='sk'

# nali-cli
alias dig="nali-dig"
# alias ping="nali-ping"
alias traceroute="nali-traceroute"

# Colorful
alias ip="ip -color"
alias diff="diff --color=auto"
alias grep='grep --color=auto'

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

# F**king X11
alias alacritty="WINIT_UNIX_BACKEND=x11 alacritty"
alias obs="XDG_SESSION_TYPE=x11 obs"

# GPG SSH
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye >/dev/null

# export TERM=xterm-256color

# Rust 
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

export L_TIME=C

export PATH=$PATH:~/.yarn/bin:~/.local/bin:~/.cargo/bin

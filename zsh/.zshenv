# Alias
alias ls="lsd"
alias find="fd"
alias cat="bat"
alias grep="rg"
alias htop="htop -t"
alias mutt='neomutt'
alias fzf='sk'

# nali-cli
alias dig="nali-dig"
# alias ping="nali-ping"
alias traceroute="nali-traceroute"

# Colorful
alias ip="ip -color"
alias diff="diff --color=auto"
alias grep='rg --color=auto'

export MANPAGER='sh -c "col -bx | bat -pl man --theme=Monokai\ Extended"'
export MANROFFOPT='-c'

# F**king X11
# alias alacritty="WINIT_UNIX_BACKEND=x11 alacritty"
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
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

export L_TIME=C

export PATH=$PATH:~/.yarn/bin:~/.local/bin:~/.cargo/bin:~/.config/scripts:~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/
export GOPATH=$HOME/.go

export NEMU_HOME=/work/ics2021/nemu
export AM_HOME=/work/ics2021/abstract-machine

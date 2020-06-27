# Alias
alias ls="lsd"
alias find="fd"
alias telegram-desktop="LANG=C telegram-desktop"
alias icat="kitty +kitten icat"
alias zinit='http_proxy="http://127.0.0.1:8118" https_proxy="http://127.0.0.1:8118" zinit'

## Proxy
alias ptg='source ~/.zsh_proxy'
alias pon='source ~/.zsh_proxy on'
alias poff='source ~/.zsh_proxy off'

## nali-cli
alias dig="nali-dig"
alias ping="nali-ping"
alias traceroute="nali-traceroute"

# GPG SSH
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye >/dev/null

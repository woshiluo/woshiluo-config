# Alias
alias ls="lsd"
alias find="fd"
alias telegram-desktop="LANG=C telegram-desktop"
alias icat="kitty +kitten icat"
alias zinit='http_proxy="http://127.0.0.1:8118" https_proxy="http://127.0.0.1:8118" zinit'
alias prtg='source ~/.zsh_proxy'

# GPG SSH
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye >/dev/null

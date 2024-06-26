# # Check screen

if [[ "$USE_SCREEN" == "" && $- == *i* ]]; then
    if [[ ! "$(</proc/$PPID/cmdline)" =~ "/usr/bin/(emacs|vim)" ]] && [[ ! $TERM == "xterm-256color" ]]; then
		export USE_SCREEN=1 
		screen -x autoscreen
		return 
	fi
fi

# Enable Powerlevel10k instant prompt. 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zmod Complie
# module_path+=( "/home/woshiluo/.local/share/zinit/module/Src" )
# zmodload zdharma_continuum/zinit

setopt HIST_IGNORE_SPACE

# ---------
# Configure
# ---------
setopt no_share_history

autoload -U select-word-style
select-word-style bash

# Load script
source ~/.config/zsh/rsync.zsh
source ~/.config/zsh/proxy.zsh
source ~/.config/zsh/backup.zsh
source ~/.zshenv

# ---------
# Init
# ---------

# Load Zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ---------
# Zinit Configure
# ---------

# p10k
zinit ice depth=1
zinit atload"source ~/.p10k.zsh" lucid nocd light-mode for \
	romkatv/powerlevel10k

# OMZ Lib
zinit lucid nocd light-mode for \
	OMZ::lib/history.zsh \
	OMZ::lib/key-bindings.zsh \

zinit wait lucid light-mode for \
	OMZ::lib/directories.zsh 

zinit wait lucid light-mode for \
	atuinsh/atuin

# Compltions & Fzf Configure
zinit wait lucid light-mode for \
	atinit"zicompinit; zicdreplay" \
		zdharma-continuum/fast-syntax-highlighting \
	atload"_zsh_autosuggest_start" \
		zsh-users/zsh-autosuggestions \
	blockf atpull'zinit creinstall -q .' \
		zsh-users/zsh-completions \
	atload"source ~/.fzf.zsh" \
		Aloxaf/fzf-tab

# OMZ plugins
zinit wait lucid light-mode for \
	OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
	OMZ::plugins/sudo/sudo.plugin.zsh \


# Skim history search
# zinit wait lucid light-mode for \
# 	'https://github.com/lotabout/skim/blob/master/shell/key-bindings.zsh'

# Zoxide
zinit wait lucid light-mode for \
	atinit'eval "$(zoxide init zsh)"' \
		zdharma-continuum/null
### End of Zinit's installer chunk

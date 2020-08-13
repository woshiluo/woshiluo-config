# 作为嵌入式终端时禁用 tmux
# https://www.reddit.com/r/tmux/comments/a2e5mn/tmux_on_dolphin_inbuilt_terminal/
# 上面的方法由于 alacritty 0.4.0 的释出而失效
if [[ "$TMUX" == "" && $- == *i* ]]; then
    if [[ ! "$(</proc/$PPID/cmdline)" =~ "/usr/bin/(dolphin|emacs|kate)" ]]; then
        exec tmux new -A -s woshiluo
		return 
    fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zmod Complie
module_path+=( "/home/woshiluo/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin

# -------------------
# Init
# -------------------
# Load env
# Load Zinit
source ~/.zshenv
source "$HOME/.zinit/bin/zinit.zsh"
setopt no_share_history

autoload -Uz compinit
autoload -Uz _zinit

(( ${+_comps} )) && _comps[zinit]=_zinit

# -------------------
# Zinit Configure
# -------------------

# p10k
zinit ice depth=1; 
zinit atload'!source ~/.p10k.zsh' lucid nocd light-mode for \
    romkatv/powerlevel10k

# OMZ Lib
zinit light-mode for \
	OMZ::lib/history.zsh \
	OMZ::lib/key-bindings.zsh \
	OMZ::lib/directories.zsh 

# Compltions & fzf Configure
zinit ice blockf
zinit atload'!source ~/.fzf.zsh' lucid nocd light-mode for \
	zsh-users/zsh-completions \
	Aloxaf/fzf-tab \
	zdharma/fast-syntax-highlighting

# Autosuggestions
zinit light zsh-users/zsh-autosuggestions
# bindkey ',' autosuggest-accept

# OMZ plugins
zinit light-mode for \
	OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
	OMZ::plugins/sudo/sudo.plugin.zsh

# Zinit plugins
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

compinit
### End of Zinit's installer chunk

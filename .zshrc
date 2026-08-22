# Most if not all of this config is a copy provided by "DREAMS OF AUTONOMY" on youtube :
# 	- The zen ZSH CONFIG
# 	- 10 zsh hacks
# 	- oh-my-posh

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export EDITOR=xim
export PATH="$HOME/.usagi/bin:$PATH"
export PATH=$PATH:~/.config/emacs/bin

# export EDITOR="~/.local/bin/xim"
# Zinit installation 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# ABANDONNED FOR IMPRACTICALLITY AND INCONVENIENCE
# # setting ~/config/zsh as the config file
# ZSH_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh"
# ZSH_ALIASES="${ZSH_CONFIG_HOME}/.aliases.zsh"
# [ ! -d "$ZSH_CONFIG_HOME" ] && mkdir -p "$ZSH_CONFIG_HOME"
# [ ! -f "$ZSH_ALIASES" ] && touch "$ZSH_ALIASES"
# source "$ZSH_ALIASES"

# Zsh plugins 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# keybinds (using vim mode with this one, Trust)
bindkey -v

# Cursor shape follows vi mode: block in normal mode, bar in insert mode
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]]; then
        echo -ne '\e[2 q'   # steady block = normal mode
    else
        echo -ne '\e[5 q'   # blinking bar = insert mode
    fi
}
zle -N zle-keymap-select

# Make sure it starts in bar/insert style at the very first prompt
function zle-line-init {
    echo -ne '\e[5 q'
}
zle -N zle-line-init

bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# History
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
# FIXME this ignore a command (not added to history) if preceeded by a space
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line 

# Magic Space
bindkey ' ' magic-space

# bind ctrl to move one word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5C' forward-word

# some zoxide related stuff 
eval "$(zoxide init zsh)"

# fzf shell integration
eval "$(fzf --zsh)"

# oh-my-posh initialisation
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen-two.toml)"


# teestion aliases 
source ~/.config/zsh/.aliases.zsh
# alias suffixes TODO : configure for .md, .lua and the likes 
source ~/.config/zsh/.aliases_suff
# TODO learn how to use gloabal zsh aliases : looks hella promising
# TODO learn how to use zmv

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

# $(thefuck --alias)

eval $(thefuck --alias fk)

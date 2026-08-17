alias hello="echo 'wait this is actually working '"

### this are custom aliases 
# alias for nvim as vim
# alias vim='nvim'
alias nvchad='NVIM_APPNAME=nvchad nvim'
alias vim='nvim'
alias xim='nvim'
alias kik="NVIM_APPNAME=nvim-kickstart nvim"

# alias for neovim 12
if [[ $HOME == "/home/noriyaki/" ]]; then
alias vi12="NVIM_APPNAME=vi12 ~/.local/bin/nvim-0.12/bin/nvim"
fi

# grepping from history
alias hgrep="bat ~/.zsh_history | grep"


# alias for zoxide
alias cd="z"

# alias for ls
alias ls='ls -hal --color=always --group-directories-first'

# alias for updating : both dnf and flatpaks
alias update='sudo dnf update && flatpak update'


# alias for bat as cat
alias cat='bat'

# alias for ani-cli to use rofi
alias anime='ani-cli --rofi'

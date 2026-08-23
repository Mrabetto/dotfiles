alias hello="echo 'wait this is actually working '"

### this are custom aliases 
# alias for nvim as vim
# alias vim='nvim'
alias nvchad='NVIM_APPNAME=nvchad nvim'
alias vim='nvim'
alias xim='nvim'
alias kik="NVIM_APPNAME=nvim-kickstart nvim"
export EDITOR="nvim"

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
BCyan='\033[1;36m'	# Cyan
NC='\033[0m' 		# No Color
alias update='sudo dnf update && echo -e "${BCyan}󰄴 Dnf Update :${NC} Done" && echo "" && flatpak update && echo -e "${BCyan}󰄴 Flatpak Update :${NC} Done"'

# alias for dnf in android
# [ $OSTYPE == "linux-android"] && alias dnf="nala"
if [[ "$OSTYPE" == "linux-android" ]] then
    alias dnf="nala"
    alias update="nala update"
fi


# alias for bat as cat
alias cat='bat'

# alias for ani-cli to use rofi
alias anime='ani-cli --rofi'

# misc git aliases 
alias gstat="git status"
alias gsw="git switch"
alias gcom="git commit"
alias gpush="git push -u origin"
alias gpull="git pull"

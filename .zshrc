ZSH_THEME="spaceship"

plugins=(
  git-auto-fetch
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias v='nvim'
alias open='xdg-open'
alias code='code .'

alias ya='yarn add'
alias yr='yarn remove'
alias yad='yarn add -D'
alias ys='yarn start'
alias yd='yarn dev'
alias yupgrade='yarn upgrade-interactive --latest'

alias cra='npx create-react-app'
alias cna='npx create-next-app'

alias gs='git status'
alias gc='git clone'
alias gp='git push'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias glg='git lg'
alias gcco='git checkout -b'

alias 'pacman -S'='yay -S'

neofetch

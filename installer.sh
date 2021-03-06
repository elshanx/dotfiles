#!/bin/sh

packages=(
  zsh
  vim
  neovim
  htop
  neofetch
  ffmpeg
  fd-find
  fd
  python-pywal
)


for u in "${packages[@]}"
do
  if    [ -x "$(command -v pacman)" ];   then yay -S $u
  elif  [ -x "$(command -v apt)" ];    then sudo apt install $u
  else break
done
echo "FAILED TO INSTALL PACKAGES: Package manager not found. You must manually install: $u">&2;

printf "packages installed\n"

# download and install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# omz plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# omz spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# fira code font
xdg-open https://github.com/tonsky/FiraCode#download--install

# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# node
nvm install node

# yarn [debian based distro]
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# change shell to zsh
chsh -s $(which zsh)

read -p "Reboot? (Y/n): " -r -n 1
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
  reboot
else printf "\nDone."
fi

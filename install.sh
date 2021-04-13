#!/bin/bash

# dotfiles retrieval
git clone https://github.com/vibhaa/dotfiles.git

# zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
# invariably shell won't be changed and might need you to run sudo vi /etc/passwd instead and change it

# copy dotfiles
cp dotfiles/bashrc ~/.bashrc
cp dotfiles/gitconfig ~/.gitconfig
cp dotfiles/tmux.conf ~/.tmux.conf
cp dotfiles/vimrc ~/.vimrc
cp dotfiles/zshrc ~/.zshrc

# install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# syntax highlighting package
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

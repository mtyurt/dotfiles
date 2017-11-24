#!/bin/bash
#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#install tools with brew
brew bundle

#for vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#for tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


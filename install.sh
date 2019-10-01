#!/bin/bash

echo ">>>>>>>>>>> INSTALLING HOMEBREW <<<<<<<<<<<<<<<"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh git gpg-agent wget go nvm rbenv zsh-syntax-highlighting tfenv


echo ">>>>>>>>>>> SYMLINKING DOTFILES <<<<<<<<<<<<<<<"

ln -fs "$(pwd)/gitconfig" ~/.gitconfig
ln -fs "$(pwd)/zshrc" ~/.zshrc
ln -fs "$(pwd)/zsh" ~/.zsh
ln -fs "$(pwd)/psqlrc" ~/.psqlrc

pip install awscli --user


#!/bin/bash

echo ">>>>>>>>>>> INSTALLING HOMEBREW <<<<<<<<<<<<<<<"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh git gpg-agent wget go zsh-syntax-highlighting asdf


echo ">>>>>>>>>>> SYMLINKING DOTFILES <<<<<<<<<<<<<<<"

ln -fs "$(pwd)/gitconfig" ~/.gitconfig
ln -fs "$(pwd)/zshrc" ~/.zshrc
ln -fs "$(pwd)/zsh" ~/.zsh
ln -fs "$(pwd)/psqlrc" ~/.psqlrc

pip install awscli --user

asdf install golang latest
asdf install ruby latest
asdf install python latest
asdf install terraform latest

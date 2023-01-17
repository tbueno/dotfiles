#!/bin/bash

echo ">>>>>>>>>>> INSTALLING HOMEBREW <<<<<<<<<<<<<<<"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install zsh git wget go zsh-syntax-highlighting asdf


echo ">>>>>>>>>>> SYMLINKING DOTFILES <<<<<<<<<<<<<<<"

ln -fs "$(pwd)/gitconfig" ~/.gitconfig
ln -fs "$(pwd)/gitignore" ~/.gitignore_global
ln -fs "$(pwd)/zshrc" ~/.zshrc
ln -fs "$(pwd)/zsh" ~/.zsh
ln -fs "$(pwd)/psqlrc" ~/.psqlrc
ln -fs "$(pwd)/tool-versions" ~/.tool-versions

echo ">>>>>>>>>>> Install asdf languages and plugins <<<<<<<<<<<<<<<"
asdf plugin add golang
asdf install golang latest
asdf plugin add ruby
asdf install ruby latest
asdf plugin add python
asdf install python latest
asdf plugin add nodejs
asdf install nodejs latest
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf install rust

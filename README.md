# dotfiles
Set of instructions and configurations to setup my personal development macbook machines.


## Manual steps

### Iterm 2

 - Install Iterm2 
 - Import profile in `./profiles/iterm.json` to add status bar, zsh and color configuration

## Setup

Setup homebrew and activate it in the current shell session:

````bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
eval "$(/opt/homebrew/bin/brew shellenv)"
````

Run `bin/install` in order to setup the minimum required applications.


## Versioning

Version for languages and other framework installed with `asdf` should be set in the `./versions` folder.
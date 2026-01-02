# dotfiles
Set of instructions and configurations to setup my personal development macbook machines.


## Manual steps

[camp](https://github.com/tbueno/camp) is used to manage my development environment, so the project should be downloaded and installed manually after the `./scripts/install` is executed.

Run `camp env bootstrap` to install the foundation tools, and then `camp env rebuild` to install the rest of the development environment.


## Setup

Setup homebrew and activate it in the current shell session:

````bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
eval "$(/opt/homebrew/bin/brew shellenv)"
````


Now, open a new shell session and continue.


# dotfiles
Set of instructions and configurations to setup my personal development macbook machines.


## Manual steps


## Setup

Setup homebrew and activate it in the current shell session:

````bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
eval "$(/opt/homebrew/bin/brew shellenv)"
````

Install Nix

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```
Then install nix-darwin:

```
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
nix-channel --update
```

Now, open a new shell session and continue.

Run `bin/install` in order to setup the minimum required applications.

Once everything is setup, the environment can be updated with the command `darwin-rebuild switch --flake ~/dev/dotfiles/config/nix-darwin`.


### Iterm 2

- Import profile in `./profiles/iterm.json` to add status bar, zsh and color configuration


## Versioning

Version for languages and other framework installed with `asdf` should be set in the `./versions` folder.

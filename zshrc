#Loads Environment configurations
. ~/.zsh/env

# CTAGS for mac osx
alias ctags="`brew --prefix`/bin/ctags"
#Autocomplete
autoload -U compinit
compinit

#Set prompt style using 'off' theme
autoload -Uz promptinit
promptinit
prompt off

#Activate vi-mode
bindkey -v

#loads extensions
source ~/.zsh/extensions/zsh-history-substring-search.zsh

#Load Aliases
. ~/.zsh/aliases

PROMPT='╭─ %~
╰─ ➜ ' # default prompt


#History related
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zsh/history
bindkey '^R' history-incremental-search-backward

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups

# Enable the ^ sign
unsetopt extendedglob

export PATH="/usr/local/sbin:$PATH"

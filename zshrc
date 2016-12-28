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

#loads extensions
source ~/.zsh/extensions/zsh.sh
source ~/.zsh/extensions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/extensions/zsh-history-substring-search.zsh

#Load Aliases
. ~/.zsh/aliases

PROMPT='╭─ %~
╰─ ➜ ' # default prompt

RPROMPT='%b$(git_super_status)'

#History related
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zsh/history

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


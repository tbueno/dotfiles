# RVM loading instructions
"$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#Autocomplete
autoload -U compinit
compinit

#Set prompt style using 'off' theme
autoload -Uz promptinit
promptinit
prompt off

#Shell Alias
alias ls="ls -lG"

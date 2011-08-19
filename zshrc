# RVM loading instructions
"$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#Autocomplete
autoload -U compinit
compinit

#Set prompt style using 'off' theme
autoload -Uz promptinit
promptinit
prompt off

# Set prompts
#PROMPT='%d%>:%{\e[0m%} > ' # default prompt
RPROMPT='[%w on %D]' # prompt for right side of screen

#Shell Alias
alias ls="ls -lG"

#Image magick
export MAGICK_HOME="/opt/ImageMagick-6.7.1"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"
export PATH=$PATH:$MAGICK_HOME/bin/

#Mysql
export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH


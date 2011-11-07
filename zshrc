#Temporary solution for RVM x GCC problen in LION
[[ -s "/Users/tbueno/.rvm/scripts/rvm" ]] && source "/Users/tbueno/.rvm/scripts/rvm"

#Autocomplete
autoload -U compinit
compinit

#Set prompt style using 'off' theme
autoload -Uz promptinit
promptinit
prompt off

source ~/.zsh/zsh.sh
 
PROMPT='╭─ %~%b$(git_super_status)  
╰─ ➜ ' # default prompt

RPROMPT='[%t, %w]' # prompt for right side of screen

#Shell Alias
alias ls="ls -lG"
alias irb="irb -r irb/completion"

#Image magick
export MAGICK_HOME="/opt/ImageMagick-6.7.1"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"
export PATH=$PATH:$MAGICK_HOME/bin/

#Mysql
export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

#NGINX
export PATH=/usr/local/nginx/sbin:$PATH

export KINDLEGEN_HOME=/Users/tbueno/dev/tools/KindleGen_Mac_i386_v1
export PATH=$KINDLEGEN_HOME:$PATH


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

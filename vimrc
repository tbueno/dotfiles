set nocompatible

" Call Pathogen
call pathogen#infect()
call pathogen#helptags()

set number
set ruler
syntax on

"Autoident
if has("autocmd")
  filetype indent on
endif
set autoindent
set copyindent     "Seriously, vim? 

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status bar
set laststatus=2

"Turning off vim backup files
set nobackup
set nowritebackup
set noswapfile

" MAPPINGS

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap ; :

" COMMAND-T configurations
set noequalalways
let g:CommandTMaxHeight=20

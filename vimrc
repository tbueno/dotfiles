set nocompatible

set number
set ruler
syntax on


"Auto ident
if has("autocmd")
  filetype indent on
endif


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


" MAPPINGS

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>


" COMMAND-T configurations
set noequalalways
let g:CommandTMaxHeight=20

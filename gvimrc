"This settings are used with macvim. I can't guarantee the support for others GUI systems.

colorscheme railscast

if has("gui_running")                       " Removing macvim's toolbar
    set guioptions=egmrt
endif

"Turning off beep
set vb t_vb=

"COMMAND-T configurations
macmenu &File.New\ Tab key=<D-T>
map <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>

"Autocompletion 
inoremap <tab> <C-p>

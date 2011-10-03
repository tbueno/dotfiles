"This settings are used with macvim. I can't guarantee the support for others GUI systems.

colorscheme railscast

if has("gui_running")                       " Removing macvim's toolbar
    set guioptions=egmrt
endif


"COMMAND-T configurations
macmenu &File.New\ Tab key=<D-T>
map <D-t> :CommandT<CR>
imap <D-t> <Esc>:CommandT<CR>

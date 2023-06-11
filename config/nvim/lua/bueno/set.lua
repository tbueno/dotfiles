-- LINES SETTINGS
-- Make line numbers default
vim.wo.number = true

-- Line related options
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable break indent
vim.o.breakindent = true


-- HISTORY SETTINGS
-- Save undo history
vim.o.undofile = true

vim.opt.swapfile = false


-- SEARCH SETTINGS
--
-- Set highlight on search
vim.opt.hlsearch = false

vim.opt.incsearch = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- GUI SETTINGS
-- Enable mouse mode
vim.o.mouse = 'a'

vim.o.termguicolors = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300


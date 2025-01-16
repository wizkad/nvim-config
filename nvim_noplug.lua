-- OPTIONS
----------------------------------

local opt = vim.opt

opt.ignorecase = true			-- case insensitive
opt.hlsearch = false			-- highlight search
opt.incsearch = true			-- incremental search
opt.tabstop = 4					-- number of columns occupied by a tab 
opt.softtabstop = 4				-- see multiple spaces as tabstops so <BS> does the right thing
opt.shiftwidth = 4            	-- width for autoindents
opt.expandtab = false          	-- " converts tabs to white space
opt.autoindent = true          	-- indent a new line the same amount as the line just typed
opt.number = true              	-- add line numbers
opt.wildmode=longest,list   	-- get bash-like tab completions
opt.mouse = ""					-- disable mouse
opt.termguicolors = true		-- enable terminal colors
opt.cursorline = true			-- highlight cursor line
opt.scrolloff = 10				-- minimal number of screen lines between cursor

vim.cmd("filetype plugin indent on")   	--allow auto-indenting depending on file type
vim.cmd("syntax on")                   	-- syntax highlighting

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- ghost charcters
opt.list = true
opt.listchars = { tab = '» ', trail = ' ', nbsp = '␣' }

-- KEYMAPS
----------------------------------

local map = vim.keymap.set
--local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd("nnoremap <C-h> :tabprevious<CR>")
vim.cmd("nnoremap <C-l> :tabnext<CR>")
vim.cmd("nnoremap <C-d> :tabe term://zsh<CR>")
--vim.keymap.set('n', 'C-h', '<cmd>tabprevious<CR>', {desc = 'Move to left tab'})
--vim.keymap.set('n', 'C-l', 'gT', {desc = 'Move to right tab'})
--vim.keymap.set('n', 'C-d', '<cmd>tabe term://zsh<CR>', {desc = 'open terminal on new tab'})

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


-- AUTOCOMANDS
----------------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when copying text',
	group = vim.api.nvim_create_augroup('highlight-yank', {clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

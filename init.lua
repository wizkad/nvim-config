-- Set to true if you have a Nerd Font installed and selected in the terminal


vim.g.have_nerd_font = true

-- OPTIONS
----------------------------------

local opt = vim.opt

opt.ignorecase = true			-- case insensitive
opt.hlsearch = false			-- highlight search
opt.incsearch = true			-- incremental search
opt.tabstop = 4					-- number of columns occupied by a tab 
opt.softtabstop = 4				-- see multiple spaces as tabstops so <BS> does the right thing
opt.shiftwidth = 4            	-- width for autoindents
opt.expandtab = true          	-- " converts tabs to white space
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

local keymap = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd("nnoremap <C-h> :tabprevious<CR>")
vim.cmd("nnoremap <C-l> :tabnext<CR>")
-- vim.cmd("nnoremap <C-d> :tabe term://zsh<CR>")

-- Diagnostic keymaps
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- plugin keymaps
keymap('n', '<leader>l', '<cmd>Lazy<CR>', {desc = 'Open Lazy plugin manager'})
keymap('n', '<leader>m', '<cmd>Mason<CR>', {desc = 'Open Mason LSP manager'})
keymap('n', '<leader>dm', '<cmd>MarkdownPreview<CR>', {desc = '[D]ocument Markdown preview'})
keymap('n', '<leader>tt', '<cmd>Floaterminal<CR>', {desc = 'Open floating terminal'})
keymap('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<CR>', {desc = 'Open horizontal terminal'})
keymap('n', '<leader>tv', '<cmd>ToggleTerm size=30 direction=vertical<CR>', {desc = 'Open horizontal terminal'})
keymap({ 'n', 'x' }, 's', '<Nop>')

-- AUTOCOMANDS
----------------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when copying text',
	group = vim.api.nvim_create_augroup('highlight-yank', {clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})


-- PLUGINS
----------------------------------

-- Install lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Import plugins 
require('lazy').setup({
	{ import = 'plugins' },
})




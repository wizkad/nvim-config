-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require("config.lazy")

local keymap = vim.keymap.set
keymap("n", "<leader>t", "", { desc = "Terminal" })
keymap("n", "<leader>tt", "<cmd>Floaterminal<CR>", { desc = "Open floating terminal" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "Open horizontal terminal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=50 direction=vertical<CR>", { desc = "Open vertical terminal" })
keymap({ "n", "x" }, "s", "<Nop>")

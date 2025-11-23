-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Escape from terminal mode into normal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Floating Terminal
vim.keymap.set("n", "<leader>fx", "<cmd>FloatingTerminal<cr>", { desc = "Toggle Floating Terminal" })

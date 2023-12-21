-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-M-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to lower window", remap = false })
vim.keymap.set("n", "<C-M-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to left window", remap = false })
vim.keymap.set("n", "<C-M-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to right window", remap = false })
vim.keymap.set("n", "<C-M-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to upper window", remap = false })
vim.keymap.set("x", "<leader>tf", ":!column -t -s '|' -o '|'<cr>", { desc = "[T]able [f]ormat", remap = false })

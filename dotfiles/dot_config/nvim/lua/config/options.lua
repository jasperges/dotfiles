-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.exrc = true
vim.opt.wrap = true
vim.g.lazyvim_python_lsp = "basedpyright"
-- Custom setting for setting the default state of Github Copilot
vim.g.copilot_enabled = false
-- Disable language providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

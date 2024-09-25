-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Group autocmd's so they can be removed first. If we don't do this, the same
-- autocmd might be added several times.
local stgitgroup = vim.api.nvim_create_augroup("filetype_stgit", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".stgit-edit.txt",
  group = stgitgroup,
  callback = function()
    vim.bo.filetype = "gitcommit"
  end,
})

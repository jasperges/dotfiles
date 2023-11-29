vim.opt_local.colorcolumn = { 88, 100 }

-- Group autocmd's so they can be removed first. If we don't do this, the same
-- autocmd is added every time we open or save a Python file.
local pythongroup = vim.api.nvim_create_augroup("filetype_python", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*.py",
  group = pythongroup,
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.organizeImports" },
        diagnostics = {},
      },
    })
  end,
})

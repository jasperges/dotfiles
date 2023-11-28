return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    -- Set up autocompletion
    local databasegroup = vim.api.nvim_create_augroup("filetype_db", { clear = true })
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = "sql,mysql,plsql",
      group = databasegroup,
      callback = function()
        require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
      end,
    })
  end,
}

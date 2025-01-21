return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  opts = {},
  init = function()
    vim.g.sonokai_style = "maia"
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_transparent_background = 1
    vim.g.sonokai_dim_inactive_windows = 1 -- only works in NeoVim
    vim.g.sonokai_menu_selection_background = "blue" -- available values 'blue', 'green', 'red'
    vim.g.sonokai_spell_foreground = "colored" -- available values: 'none', 'colored'
    vim.g.sonokai_diagnostic_text_highlight = 1
    vim.g.sonokai_diagnostic_line_highlight = 1
    vim.g.sonokai_diagnostic_virtual_text = "highlighted" -- available values: 'grey', 'colored', 'highlighted'
    vim.g.sonokai_disable_terminal_colors = 1
  end,
  -- config = function()
  --   vim.cmd.colorscheme("sonokai")
  -- end,
}

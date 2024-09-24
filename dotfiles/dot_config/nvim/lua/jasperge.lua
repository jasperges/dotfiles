-- Inserts blank lines below the current line in Neovim.
-- @param count The number of blank lines to insert.
function BlankDown(count)
  local current_line = vim.api.nvim_win_get_cursor(0)[1] -- Get the current line number
  local blank_lines = {}
  for _ = 1, count do
    table.insert(blank_lines, "")
  end
  vim.api.nvim_buf_set_lines(0, current_line, current_line, false, blank_lines)
end

-- Inserts blank lines above the current line in Neovim.
-- @param count The number of blank lines to insert.
function BlankUp(count)
  local current_line = vim.api.nvim_win_get_cursor(0)[1] -- Get the current line number
  local blank_lines = {}
  for _ = 1, count do
    table.insert(blank_lines, "")
  end
  vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, blank_lines)
end

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

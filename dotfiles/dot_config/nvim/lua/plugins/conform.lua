return {
  "stevearc/conform.nvim",
  opts = function()
    local spaces = 0
    if vim.bo.expandtab then
      spaces = vim.bo.shiftwidth
    end
    local opts = {
      formatters = {
        shfmt = {
          prepend_args = { "-i", tostring(spaces), "-bn", "-ci", "-sr" },
        },
      },
      formatters_by_ft = {
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
    }
    return opts
  end,
}

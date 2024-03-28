return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      shfmt = {
        prepend_args = { "-i", 4, "-bn", "-ci", "-sr" },
      },
    },
    formatters_by_ft = {
      css = { "prettier" },
      go = { "goimports" },
      html = { "prettier" },
      json = { "prettier" },
    },
  },
}

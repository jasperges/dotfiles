return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      shfmt = {
        prepend_args = { "-i", 4, "-bn", "-ci", "-sr" },
      },
    },
    formatters_by_ft = {
      shfmt = { "shfmt" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
    },
  },
}

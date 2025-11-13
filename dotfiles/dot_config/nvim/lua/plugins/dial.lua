return {
  "monaqa/dial.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.groups.default, {
      require("dial.augend").date.alias["%Y-%m-%d"],
      require("dial.augend").date.alias["%H:%M:%S"],
    })
  end,
}

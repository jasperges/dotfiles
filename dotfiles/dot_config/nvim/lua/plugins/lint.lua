return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      python = { "mypy" },
      yaml = { "cfn_lint" },
    },
    linters = {
      cfn_lint = {
        condition = function(ctx)
          return ctx.filename:match(".*%.cfn%.ya?ml$")
        end,
      },
    },
  },
}

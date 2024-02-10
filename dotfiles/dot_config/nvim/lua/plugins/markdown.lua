return {
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    opts = function()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    keys = {
      { "<leader>pp", mode = "n", "<cmd>PeekOpen<CR>",  desc = "Peek Open" },
      { "<leader>pc", mode = "n", "<cmd>PeekClose<CR>", desc = "Peek Close" },
    },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    dependencies = { "plenary.nvim" },
    opts = {
      modules = {
        yaml = true,
        cmp = true,
      },
      perspective = {
        priority = "current",
        root_tell = false,
        nvim_wd_heel = true,
        update = true,
      },
      links = {
        transform_explicit = false,
      },
    },
  },
}

return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- Explicitly disable the <leader>gs mapping
      { "<leader>gs", false },
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", mode = "n", "<cmd>Git<cr>", desc = "Git status" },
    },
  },
}

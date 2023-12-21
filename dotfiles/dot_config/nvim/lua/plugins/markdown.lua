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
      { "<leader>pp", mode = "n", "<cmd>PeekOpen<CR>", desc = "Peek Open" },
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
        priority = "root",
        root_tell = "index.md",
        nvim_wd_heel = true,
        update = true,
      },
      links = {
        transform_explicit = false,
      },
    },
  },
  --   {
  --     "renerocksai/telekasten.nvim",
  --     dependencies = { "nvim-telescope/telescope.nvim", "renerocksai/calendar-vim" },
  --     opts = {
  --       home = vim.fn.expand("~/documents/syncthing/documenten/zettelkasten"),
  --     },
  --     keys = {
  --       -- Launch panel if nothing is typed after <leader>z
  --
  --       { "<leader>z", mode = "n", "<cmd>Telekasten panel<CR>", desc = "Telekasten panel" },
  --       -- Most used functions
  --       { "<leader>zf", mode = "n", "<cmd>Telekasten find_notes<CR>", desc = "Telekasten find notes" },
  --       { "<leader>zg", mode = "n", "<cmd>Telekasten search_notes<CR>", desc = "Telekasten search notes" },
  --       { "<leader>zd", mode = "n", "<cmd>Telekasten goto_today<CR>", desc = "Telekasten go to today" },
  --       { "<leader>zz", mode = "n", "<cmd>Telekasten follow_link<CR>", desc = "Telekasten follow link" },
  --       { "<leader>zn", mode = "n", "<cmd>Telekasten new_note<CR>", desc = "Telekasten new note" },
  --       { "<leader>zc", mode = "n", "<cmd>Telekasten show_calendar<CR>", desc = "Telekasten show calendar" },
  --       { "<leader>zb", mode = "n", "<cmd>Telekasten show_backlinks<CR>", desc = "Telekasten show backlinks" },
  --       { "<leader>zI", mode = "n", "<cmd>Telekasten insert_img_link<CR>", desc = "Telekasten insert image link" },
  --
  --       -- Call insert link automatically when we start typing a link
  --       { "[[", mode = "i", "<cmd>Telekasten insert_link<CR>", "Telekasten insert link" },
  --     },
  --   },
}

-- -- Prettify the whole table under the cursor:
-- :lua MdTableFormat<CR>
--
-- -- Delete the column under the cursor:
-- :lua MdTableColDelete<CR>
--
-- -- Insert a new column before the current column (where the cursor is):
-- :lua MdTableColInsert<CR>
--
-- -- Change the text alignment of the current column:
-- :lua MdTableColCircleAlign<CR>
--
-- -- Swap the current column with the one left to it:
-- :lua MdTableColSwap<CR>

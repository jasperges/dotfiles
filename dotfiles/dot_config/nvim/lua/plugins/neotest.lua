return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
  },
  opts = {
    adapters = {
      "neotest-python",
      "neotest-golang",
    },
  },
}

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "fernanluyano/neotest-scala",
    "nvim-neotest/neotest-go",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("neotest").setup({
      output_panel = {
        enabled = true,
        open = "botright vsplit | vertical resize 80",
      },
      adapters = {
        require("neotest-go"),
        require("neotest-scala")({
          runner = "bloop",
          framework = "scalatest",
        }),
      },
    })
  end,
}

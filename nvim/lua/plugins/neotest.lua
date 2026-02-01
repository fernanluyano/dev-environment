return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "stevanmilic/neotest-scala",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("neotest").setup({
      output_panel = {
        enabled = true,
        open = "botright vsplit | vertical resize 80",
      },
      adapters = {
        require("neotest-scala")({
          runner = "bloop",
          framework = "scalatest",
        }),
      },
    })
  end,
}

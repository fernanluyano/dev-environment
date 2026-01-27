return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "stevanmilic/neotest-scala",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-scala")({
            runner = "sbt", -- "sbt" or "bloop"
            framework = {
              "scalatest", -- you can add more if needed
            },
          }),
        },
      })
    end,
  },
}

return {
  { "ThePrimeagen/vim-be-good" },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      require("virt-column").setup({
        enabled = true,
        virtcolumn = "120",
        char = " │", -- Use a solid vertical line character
      })
    end,
  },
}

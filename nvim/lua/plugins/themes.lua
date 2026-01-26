return {
  {
    "V4N1LLA-1CE/xcodedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("xcodedark").setup({
        -- New color scheme with your specifications
        transparent = true, -- or false if you prefer solid background

        integrations = {
          telescope = true,
          nvim_tree = true,
          gitsigns = true,
          bufferline = true,
          incline = true,
          lazygit = true,
          which_key = true,
          notify = true,
          snacks = true,
          blink = true, -- blink.cmp completion menu
        },

        -- Font weight customization
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
          functions = {},
          variables = {},
          strings = {},
          booleans = { bold = true },
          types = {},
          constants = {},
          operators = {},
          punctuation = {},
        },

        terminal_colors = true,
      })
      vim.cmd.colorscheme("xcodedark")
    end,
  },
}

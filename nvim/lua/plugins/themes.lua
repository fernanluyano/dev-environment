return {
  {
    "V4N1LLA-1CE/xcodedark.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
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
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    enabled = false,
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      vim.cmd.colorscheme("sonokai")
    end,
  },
}

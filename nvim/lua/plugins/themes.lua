return {
  {
    "V4N1LLA-1CE/xcodedark.nvim",
    -- dir = "/Users/fberlanga/dev/github/xcodedark.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
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
          keywords = { bold = false },
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

        color_overrides = {
          keyword = "#E07AB2",
          string = "#FC8A5E",
          bg = "#1A1B21",
          variable = "#C8C8C8",
          constant = "#C8C8C8",
          parameter = "#1C68BD",
        },
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
    enabled = false,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      vim.cmd.colorscheme("sonokai")
    end,
  },
}

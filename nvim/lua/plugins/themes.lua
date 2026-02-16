return {
  {
    "V4N1LLA-1CE/xcodedark.nvim",
    -- dir = "/Users/fberlanga/dev/github/xcodedark.nvim",
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
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      require("onedark").setup({
        style = "darker",
        colors = {
          red = "#A0354A",
        },
      })
      require("onedark").load()
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
      vim.g.sonokai_style = "maia"
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_palette_override = {
        red = { "#c97b84", "203" },
        green = { "#7aab6e", "107" },
      }
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          telescope = { enabled = true },
          nvim_tree = true,
          gitsigns = true,
          which_key = true,
          notify = true,
          blink_cmp = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(_)
          return {}
        end,
        theme = "wave",
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}

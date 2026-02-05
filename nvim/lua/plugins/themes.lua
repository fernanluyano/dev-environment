return {
  {
    "V4N1LLA-1CE/xcodedark.nvim",
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
          keywords = {},
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
          string = "#FF978A",
          bg = "#1a1b21",
        },
      })
      vim.cmd.colorscheme("xcodedark")

      -- Wait a bit for colorscheme to fully load, then override
      vim.defer_fn(function()
        -- TreeSitter and lsp groups
        vim.api.nvim_set_hl(0, "@keyword", { fg = "#E07AB2", bold = false })
        vim.api.nvim_set_hl(0, "@boolean.scala", { fg = "#E07AB2", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.scala", { fg = "#E07AB2", bold = false })
        vim.api.nvim_set_hl(0, "@lsp.type.keyword.scala", { fg = "#E07AB2", bold = false })
        vim.api.nvim_set_hl(0, "@lsp.type.modifier.scala", { fg = "#E07AB2", bold = false })

        vim.api.nvim_set_hl(0, "@string", { fg = "#E89B7A" })
        vim.api.nvim_set_hl(0, "@string.scala", { fg = "#E89B7A" })

        vim.api.nvim_set_hl(0, "@comment", { fg = "#6C7986", italic = true })
        vim.api.nvim_set_hl(0, "@comment.scala", { fg = "#6C7986", italic = true })

        vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1b21" })
      end, 100)
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

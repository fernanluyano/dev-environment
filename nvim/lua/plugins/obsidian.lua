return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "main",
        path = vim.env.OBSIDIAN_VAULT or "~/Documents/obsidian/personal",
      },
    },

    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },

    picker = {
      name = "telescope.nvim",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
      tag_mappings = {
        tag_note = "<C-x>",
        insert_tag = "<C-l>",
      },
    },

    sort_by = "modified",
    sort_reversed = true,

    open_app_foreground = true,

    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,

    ui = { enable = false },

    mappings = {
      ["<leader>of"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = "Follow link" },
      },
      ["<leader>oc"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true, desc = "Toggle checkbox" },
      },
      ["<leader>oo"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true, desc = "Smart action" },
      },
      ["<leader>os"] = {
        action = "<cmd>ObsidianQuickSwitch<cr>",
        opts = { buffer = true, desc = "Quick switch" },
      },
      ["<leader>og"] = {
        action = "<cmd>ObsidianSearch<cr>",
        opts = { buffer = true, desc = "Search" },
      },
      ["<leader>ot"] = {
        action = "<cmd>ObsidianTags<cr>",
        opts = { buffer = true, desc = "Tags" },
      },
      ["<leader>on"] = {
        action = "<cmd>ObsidianNew<cr>",
        opts = { buffer = true, desc = "New note" },
      },
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    require("which-key").add({ "<leader>o", group = "obsidian", buffer = true })
  end,
}

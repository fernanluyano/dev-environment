return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<A-k>"] = actions.move_selection_previous, -- move to prev result
            ["<A-j>"] = actions.move_selection_next, -- move to ext result
            ["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end,

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  },
}

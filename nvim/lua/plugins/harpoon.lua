return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    local harpoon = require("harpoon")

    -- test comment
    harpoon:setup()

    -- Open harpoon files in splits from inside the UI
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })
        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })
        vim.keymap.set("n", "<Esc>", function()
          vim.api.nvim_win_close(0, true)
        end, { buffer = cx.bufnr })
      end,
    })
  end,

  keys = function()
    local harpoon = require("harpoon")

    local function telescope_harpoon()
      local conf = require("telescope.config").values
      local file_paths = {}
      for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, item.value)
      end
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    return {
      -- left home row: actions
      { "<leader>ha", function() harpoon:list():add() end,                         desc = "Harpoon add file" },
      { "<leader>hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon menu" },
      { "<leader>hf", telescope_harpoon,                                           desc = "Harpoon (telescope)" },
      -- right home row: jump to file
      { "<leader>hj", function() harpoon:list():select(1) end,                     desc = "Harpoon file 1" },
      { "<leader>hk", function() harpoon:list():select(2) end,                     desc = "Harpoon file 2" },
      { "<leader>hl", function() harpoon:list():select(3) end,                     desc = "Harpoon file 3" },
      { "<leader>h;", function() harpoon:list():select(4) end,                     desc = "Harpoon file 4" },
    }
  end,
}

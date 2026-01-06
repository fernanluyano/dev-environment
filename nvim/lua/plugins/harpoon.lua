return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon.setup({})

    -- key mappings for basic navigation
    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })

    vim.keymap.set("n", "<leader>hd", function()
      harpoon:list():remove()
    end, { desc = "Harpoon remove file" })

    -- Telescope integration
    local conf = require("telescope.config")
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            -- Map Alt+j to move down instead
            map("i", "<A-j>", function()
              require("telescope.actions").move_selection_next(prompt_bufnr)
            end)

            -- Map Alt+k to move up instead
            map("i", "<A-k>", function()
              require("telescope.actions").move_selection_previous(prompt_bufnr)
            end)

            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<leader>hh", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open Harpoon window" })

    -- Quick select files 1-4
    vim.keymap.set("n", "<leader>h1", function()
      toggle_telescope(harpoon:list().select(1))
    end, { desc = "Open Harpoon file 1" })

    vim.keymap.set("n", "<leader>h2", function()
      toggle_telescope(harpoon:list().select(2))
    end, { desc = "Open Harpoon file 2" })

    vim.keymap.set("n", "<leader>h3", function()
      toggle_telescope(harpoon:list().select(3))
    end, { desc = "Open Harpoon file 3" })

    vim.keymap.set("n", "<leader>h4", function()
      toggle_telescope(harpoon:list().select(4))
    end, { desc = "Open Harpoon file 4" })

    -- Toggle prev and next buffers within Harpoon list
    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Harpoon prev" })
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Harpoon move_selection_next" })
  end,
}

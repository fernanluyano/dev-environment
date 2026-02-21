return {
  "otavioschwanck/arrow.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    show_icons = true,
    always_show_path = false,
    separate_by_branch = true,
    hide_handbook = false,
    hide_buffer_handbook = false,
    save_path = function()
      return vim.fn.stdpath("cache") .. "/arrow"
    end,
    mappings = {
      edit = "e",
      delete_mode = "d",
      clear_all_items = "C",
      toggle = "s",
      open_vertical = "v",
      open_horizontal = "-",
      quit = "q",
      remove = "x",
      next_item = "L",
      prev_item = "H",
    },
    window = {
      width = "auto",
      height = "auto",
      row = "auto",
      col = "auto",
      border = "double",
    },
    per_buffer_config = {
      lines = 4,
      sort_automatically = true,
      satellite = {
        enable = false,
        overlap = true,
        priority = 1000,
      },
      zindex = 10,
    },
    separate_save_and_remove = true,
    leader_key = ";",
    buffer_leader_key = "m",
    save_key = "git_root",
    global_bookmarks = false,
    index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP",
  },
}

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  commit = "ecce93ff7db4461e942c03e0fcc64bd785df4057",
  event = "LspAttach",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
      preset = "modern",
      transparent_bg = true,
      options = {
        multilines = {
          enabled = true,
        },
        add_messages = {
          display_count = true,
        },
        show_source = {
          enabled = false,
        },
      },
      -- List of filetypes to disable the plugin for
      disabled_ft = {},
    })

    -- disable default virtual text
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}

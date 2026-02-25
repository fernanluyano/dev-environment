return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      scala = { "scalafmt" },
      go = { "goimports" },
    },
    -- Disable auto-format on save
    -- Manual formatting available via <leader>cf keybinding
    format_on_save = false,
  },
}

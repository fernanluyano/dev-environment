return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0",
  event = { "InsertLeave", "TextChanged" },
  config = function()
    require("auto-save").setup({
      enabled = true,
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave", "TextChanged" },
      },
      debounce_delay = 1000, -- save after 1 second of no typing
    })
  end,
}

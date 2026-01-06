return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      scala = { "scalafmt" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}

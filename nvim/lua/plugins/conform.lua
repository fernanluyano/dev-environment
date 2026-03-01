return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      cs = { "csharpier" },
      scala = { "scalafmt" },
      go = { "goimports" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      xml = { "xmlformat" },
      yaml = { "prettier" },
    },
    -- Disable auto-format on save
    -- Manual formatting available via <leader>cf keybinding
    format_on_save = false,
    formatters = {
      csharpier = {
        command = "csharpier",
        args = { "format", "--write-stdout" },
        to_stdin = true,
      },
      xmlformat = {
        command = "xmlformat",
      },
    },
  },
}

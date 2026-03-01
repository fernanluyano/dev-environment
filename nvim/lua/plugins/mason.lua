return {
  "mason-org/mason.nvim",
  opts = {
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    ensure_installed = {
      "csharpier",
      "delve",
      "gofumpt",
      "goimports",
      "golangci-lint",
      "gopls",
      "json-lsp",
      "netcoredbg",
      "prettier",
      "roslyn",
      "rzls",
      "stylua",
      "xmlformatter",
    },
    automatic_installation = true,
  },
}

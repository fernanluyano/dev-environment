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
      "json-lsp",
      "stylua",
      "roslyn",
      "netcoredbg",
      "gopls",
      "gofumpt",
      "goimports",
      "delve",
      "golangci-lint",
    },
    automatic_installation = true,
  },
}

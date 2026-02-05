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
      "netcoredg",
    },
    automatic_installation = true,
  },
}

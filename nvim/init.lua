-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lsp")

return {
  "nvim-lua/plenary.vim", -- lua functions that many plugins use
}

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" }, -- Run on these events
  config = function()
    local lint = require("lint")

    -- Define linters for specific file types
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      lua = { "stylua" },
      markdown = { "vale" },
      python = { "ruff" },
    }

    -- Autocommand to run linters when leaving insert mode or saving a file
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}

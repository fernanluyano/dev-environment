-- metals.lua
return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()

    metals_config.on_attach = function(client, bufnr)
      local dap = require("dap")
      local metals = require("metals")

      -- Register the scala adapter
      metals.setup_dap()

      -- Only set configs once (avoid duplicates on re-attach)
      if not dap.configurations.scala then
        dap.configurations.scala = {
          {
            type = "scala",
            request = "launch",
            name = "RunOrTest",
            metals = {
              runType = "runOrTestFile",
            },
          },
          {
            type = "scala",
            request = "launch",
            name = "Test Target",
            metals = {
              runType = "testTarget",
            },
          },
          {
            name = "Debug Attach (5005)",
            type = "scala",
            request = "attach",
            hostName = "127.0.0.1",
            port = 5005,
            metals = {},
          },
        }
      end
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}

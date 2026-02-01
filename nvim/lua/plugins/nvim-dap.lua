-- dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- dap itself needs no config here; configs are set later
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "rcarratala/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      require("dapui").setup()

      local dap = require("dap")
      dap.listeners.before["event_initialized"]["dapui_config"] = function()
        require("dapui").open()
      end
      dap.listeners.before["event_terminated"]["dapui_config"] = function()
        require("dapui").close()
      end
      dap.listeners.before["event_exited"]["dapui_config"] = function()
        require("dapui").close()
      end
    end,
  },
}

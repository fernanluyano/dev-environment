return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- netcoredbg adapter for C#
      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
        {
          type = "coreclr",
          name = "Attach",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "rcarratala/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      local dap = require("dap")
      require("dapui").setup()

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

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "stevanmilic/neotest-scala",
    "nvim-neotest/neotest-go",
    "mfussenegger/nvim-dap",
  },
  config = function()
    -- neotest-scala only reads line 1 for the package name, missing chained
    -- package declarations (e.g. `package foo` then `package bar` on line 2).
    local scala_utils = require("neotest-scala.utils")
    scala_utils.get_package_name = function(file)
      local lib = require("neotest.lib")
      local success, lines = pcall(lib.files.read_lines, file)
      if not success then
        return nil
      end
      local parts = {}
      for _, line in ipairs(lines) do
        local pkg = line:match("^package%s+([%w%.]+)")
        if pkg then
          table.insert(parts, pkg)
        elseif #parts > 0 then
          break
        end
      end
      if #parts > 0 then
        return table.concat(parts, ".") .. "."
      end
      return ""
    end

    require("neotest").setup({
      output_panel = {
        enabled = true,
        open = "botright vsplit | vertical resize 80",
      },
      adapters = {
        require("neotest-go"),
        require("neotest-scala")({
          runner = "bloop",
          framework = "scalatest",
        }),
      },
    })
  end,
}

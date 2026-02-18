-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local map = vim.keymap.set

-- neotest
local neotest = require("neotest")

map("n", "<leader>h", "<Nop>", { desc = "Harpoon" })
map("n", "<leader>C", "<Nop>", { desc = "Code Compilaion/Build/Tools" })
map("n", "<leader>Cc", "<cmd>terminal make compile<CR>", { desc = "Compile Project" })

map("n", "<leader>t", "<Nop>", { desc = "Testing" })
map("n", "<leader>tt", function()
  neotest.run.run()
end, { desc = "Run nearest test" })

map("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run test file" })

map("n", "<leader>ta", function()
  neotest.run.run(vim.fn.getcwd())
end, { desc = "Run all tests" })

map("n", "<leader>ts", function()
  neotest.summary.toggle()
end, { desc = "Toggle test summary" })

map("n", "<leader>to", function()
  neotest.output.open()
end, { desc = "Show test output" })

map("n", "<leader>td", function()
  neotest.run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })

-- dap
local dap = require("dap")

map("n", "<F1>", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<F2>", dap.continue, { desc = "Continue" })
map("n", "<F3>", dap.run_to_cursor, { desc = "Run to Cursor" })
map("n", "<F4>", dap.step_over, { desc = "Step over" })
map("n", "<F5>", dap.step_out, { desc = "Step out" })
map("n", "<F6>", dap.step_into, { desc = "Step into" })
map("n", "<F7>", dap.terminate, { desc = "Terminate" })

map("n", "<leader>d?", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "Inspect value" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Format
map("n", "<leader>cf", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })

-- Tmux navigator
if os.getenv("TMUX") then
  map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
  map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")
end

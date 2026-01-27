-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>C", "<Nop>", { desc = "Code Compilaion/Build/Tools" })
map("n", "<leader>Cc", "<cmd>terminal make compile<CR>", { desc = "Compile Project" })
map("n", "<leader>Ct", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>Cf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run test file" })
map("n", "<leader>Ca", function()
  require("neotest").run.run(vim.fn.getcwd())
end, { desc = "Run all tests" })
map("n", "<leader>Cs", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })
map("n", "<leader>Co", function()
  require("neotest").output.open()
end, { desc = "Show test output" })

map("n", "<leader>h", "<Nop>", { desc = "Harpoon" })
-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Tmux navigator
if os.getenv("TMUX") then
  map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
  map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")
end

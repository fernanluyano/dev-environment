return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
    float_opts = {
      border = "curved",
      height = math.floor(vim.o.lines * 0.8),
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  keys = {
    { [[<C-\>]], "<cmd>ToggleTerm 1 direction=float<cr>", desc = "Toggle terminal" },
    { "<leader>Tf", "<cmd>ToggleTerm 1 direction=float<cr>", desc = "Terminal Float" },
    { "<leader>Th", "<cmd>ToggleTerm 2 size=30 direction=horizontal<cr>", desc = "Terminal Horizontal" },
    { "<leader>Tv", "<cmd>ToggleTerm 3 size=140 direction=vertical<cr>", desc = "Terminal Vertical" },
    { "<leader>Ts", "<cmd>lua _SBT_TOGGLE()<CR>", desc = "SBT Shell" },
    { "<leader>Tn", "<cmd>lua _NODE_TOGGLE()<CR>", desc = "Node" },
    { "<leader>Tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", desc = "Python" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Terminal mode mappings
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Exit terminal mode to normal mode
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      -- Alternative way to exit terminal mode (useful if <esc> is needed in terminal)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      -- Navigate to left window
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      -- Navigate to bottom window
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      -- Navigate to top window
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      -- Navigate to right window
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      -- Allow window commands in terminal mode
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

    -- Custom terminal functions
    local Terminal = require("toggleterm.terminal").Terminal

    -- Store terminals globally
    _G.terminals = _G.terminals or {}

    -- SBT
    _G.terminals.sbt = Terminal:new({
      cmd = "sbt",
      direction = "float",
      count = 6,
    })

    function _SBT_TOGGLE()
      _G.terminals.sbt:toggle()
    end

    -- Node
    _G.terminals.node = Terminal:new({
      cmd = "node",
      direction = "float",
      count = 7,
    })

    function _NODE_TOGGLE()
      _G.terminals.node:toggle()
    end

    -- Python
    _G.terminals.python = Terminal:new({
      cmd = "python",
      direction = "float",
      count = 8,
    })

    function _PYTHON_TOGGLE()
      _G.terminals.python:toggle()
    end
  end,
}

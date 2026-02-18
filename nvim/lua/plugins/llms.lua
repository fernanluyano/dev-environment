return {
  -- Claude Code
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal = {
        provider = "snacks",
        snacks_win_opts = {
          position = "bottom",
          height = 0.5,
          width = 1.0,
          border = "single",
        },
      },
      diff_opts = {
        auto_close_on_accept = true,
        vertical_split = true,
        open_in_current_tab = false,
        keep_terminal_focus = true,
      },
    },
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },

  -- -- Code Companion
  -- {
  --   "olimorris/codecompanion.nvim",
  --   version = "^18.0.0",
  --   opts = {},
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

  -- -- Copilot
  -- {
  --   "github/copilot.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     -- Enable Copilot
  --     vim.g.copilot_enabled = false
  --
  --     -- Disable Copilot's default Tab mapping
  --     vim.g.copilot_no_tab_map = true
  --
  --     -- Accept suggestion with Ctrl-Y (common convention)
  --     vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
  --       expr = true,
  --       replace_keycodes = false,
  --       silent = true,
  --     })
  --
  --     -- Additional keybindings
  --     vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { silent = true })
  --     vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", { silent = true })
  --     vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", { silent = true })
  --
  --     -- Enable for filetypes
  --     vim.g.copilot_filetypes = {
  --       ["*"] = false,
  --       java = true,
  --       scala = true,
  --       lua = true,
  --       python = true,
  --       go = true,
  --       rs = true,
  --       yaml = true,
  --       yml = true,
  --       md = true,
  --     }
  --   end,
  -- },
  --
  -- -- Copilot Chat with Claude
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     { "github/copilot.vim" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  --   event = "VeryLazy",
  --   ft = {
  --     "scala",
  --     "java",
  --     "python",
  --     "javascript",
  --     "typescript",
  --     "javascriptreact",
  --     "typescriptreact",
  --     "lua",
  --     "rust",
  --     "go",
  --     "cpp",
  --     "c",
  --     "sql",
  --     "sh",
  --     "bash",
  --     "zsh",
  --     "markdown",
  --     "yaml",
  --     "toml",
  --     "json",
  --   },
  --   config = function()
  --     require("CopilotChat").setup({
  --       debug = false,
  --       model = "claude-sonnet-4.5",
  --       window = {
  --         layout = "vertical",
  --         width = 0.4,
  --         height = 0.6,
  --       },
  --       mappings = {
  --         complete = {
  --           detail = "Use @<Tab> or /<Tab> for options.",
  --           insert = "<Tab>",
  --         },
  --         close = {
  --           normal = "q",
  --           insert = "<C-c>",
  --         },
  --         reset = {
  --           normal = "<C-r>",
  --           insert = "<C-r>",
  --         },
  --         submit_prompt = {
  --           normal = "<CR>",
  --           insert = "<C-s>",
  --         },
  --       },
  --       system_prompt = [[You are an AI programming assistant powered by Claude.
  -- You are precise, thoughtful, and provide clear explanations.
  -- When reviewing code, you focus on correctness, performance, and best practices.
  -- You provide actionable suggestions and explain your reasoning.]],
  --       prompts = {
  --         Explain = {
  --           prompt = "/COPILOT_EXPLAIN Write a detailed explanation for the active selection as paragraphs of text.",
  --         },
  --         Review = {
  --           prompt = "/COPILOT_REVIEW Review the selected code thoroughly. Check for bugs, performance issues, and suggest improvements.",
  --         },
  --         Fix = {
  --           prompt = "/COPILOT_GENERATE There is a problem in this code. Analyze the issue and rewrite the code with the bug fixed.",
  --         },
  --         Optimize = {
  --           prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readability. Explain the optimizations.",
  --         },
  --         Docs = {
  --           prompt = "/COPILOT_GENERATE Please add comprehensive documentation comments for the selection.",
  --         },
  --         Tests = {
  --           prompt = "/COPILOT_GENERATE Please generate comprehensive unit tests for my code.",
  --         },
  --         ScalaStyle = {
  --           prompt = "Review this Scala code for idiomatic style, proper use of functional programming patterns, immutability, and Scala best practices. Suggest improvements.",
  --         },
  --         JavaStyle = {
  --           prompt = "Review this Java code for proper OOP design, Java conventions, SOLID principles, and best practices. Suggest improvements.",
  --         },
  --         Refactor = {
  --           prompt = "/COPILOT_GENERATE Refactor this code to improve its structure, readability, and maintainability while preserving functionality.",
  --         },
  --       },
  --     })
  --
  --     vim.api.nvim_create_user_command("CopilotScalaHelp", function()
  --       require("CopilotChat").ask(
  --         "Help me with this Scala code. Explain idiomatic Scala patterns I should use and how to improve this code."
  --       )
  --     end, { range = true })
  --
  --     vim.api.nvim_create_user_command("CopilotJavaHelp", function()
  --       require("CopilotChat").ask(
  --         "Help me with this Java code. Explain Java best practices I should follow and how to improve this code."
  --       )
  --     end, { range = true })
  --   end,
  --   keys = {
  --     {
  --       "<leader>cc",
  --       function()
  --         require("CopilotChat").open()
  --       end,
  --       desc = "Open Copilot Chat (Claude)",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>ct",
  --       function()
  --         require("CopilotChat").toggle()
  --       end,
  --       desc = "Toggle Copilot Chat",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>cq",
  --       function()
  --         local input = vim.fn.input("Ask Claude: ")
  --         if input ~= "" then
  --           require("CopilotChat").ask(input)
  --         end
  --       end,
  --       desc = "Quick question to Claude",
  --     },
  --     {
  --       "<leader>ce",
  --       function()
  --         require("CopilotChat").ask("Explain this code in detail")
  --       end,
  --       desc = "Explain code",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>cr",
  --       function()
  --         require("CopilotChat").ask("Review this code thoroughly")
  --       end,
  --       desc = "Review code",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>cf",
  --       function()
  --         require("CopilotChat").ask("Fix this code")
  --       end,
  --       desc = "Fix code",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>co",
  --       function()
  --         require("CopilotChat").ask("Optimize this code")
  --       end,
  --       desc = "Optimize code",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>cT",
  --       function()
  --         require("CopilotChat").ask("Write comprehensive tests for this code")
  --       end,
  --       desc = "Generate tests",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>cd",
  --       function()
  --         require("CopilotChat").ask("Add comprehensive documentation for this code")
  --       end,
  --       desc = "Generate docs",
  --       mode = "v",
  --     },
  --     {
  --       "<leader>cR",
  --       function()
  --         require("CopilotChat").ask("Refactor this code to improve structure and readability")
  --       end,
  --       desc = "Refactor code",
  --       mode = "v",
  --     },
  --     { "<leader>cs", ":CopilotScalaHelp<CR>", desc = "Scala best practices", mode = "v", ft = "scala" },
  --     { "<leader>cj", ":CopilotJavaHelp<CR>", desc = "Java best practices", mode = "v", ft = "java" },
  --   },
  -- },
}

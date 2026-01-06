return {
  "isak102/ghostty.nvim",
  config = function()
    require("ghostty").setup({
      file_pattern = "*/ghostty/config",
      -- The ghostty executable to run.
      ghostty_cmd = "ghostty",
      -- The timeout in milliseconds for the check command.
      -- If the command takes longer than this it will be killed.
      check_timeout = 1000,
    })
  end,
}

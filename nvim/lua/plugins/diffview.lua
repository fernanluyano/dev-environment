return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>gd",
      function()
        if next(require("diffview.lib").views) ~= nil then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Toggle Diffview",
    },
  },
}

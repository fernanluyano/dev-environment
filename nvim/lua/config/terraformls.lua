-- Register filetypes
vim.filetype.add({
  extension = {
    tf = "terraform",
    tfvars = "terraform-vars",
  },
  pattern = {
    [".*%.tfvars"] = "terraform-vars",
    [".*%.tf%.json"] = "terraform",
  },
})

return {
  filetypes = { "terraform", "terraform-vars" },

  settings = {
    ["terraform-ls"] = {
      experimentalFeatures = {
        validateOnSave = true,
        prefillRequiredFields = true,
      },
    },
  },
}

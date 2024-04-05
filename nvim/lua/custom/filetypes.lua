local filetype = vim.filetype

filetype.add({
  filename = {
    ["gitconfig"] = "gitconfig",
  },
  pattern = {
    [".*.json.jbuilder"] = "ruby",
  },
})

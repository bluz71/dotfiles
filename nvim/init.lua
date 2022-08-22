local colorscheme = vim.cmd.colorscheme
local fn = vim.fn

require("custom.options") -- Options
require("custom.mappings") -- Mappings
require("custom.packer") -- Plugin Manager
require("custom.autocmds") -- Auto-commands.

-- Colorscheme, load from a dotfile if it exists.
if fn.filereadable(fn.expand("~/.colorscheme")) == 1 then
  colorscheme(fn.readfile(fn.expand("~/.colorscheme"))[1])
else
  colorscheme("moonfly")
end

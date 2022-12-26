local colorscheme = vim.cmd.colorscheme
local fn = vim.fn

require("custom.options")
require("custom.mappings")
require("custom.autocmds")
require("custom.lazy") -- Plugin Manager

-- Colorscheme, load from a dotfile if it exists.
if fn.filereadable(fn.expand("~/.colorscheme")) == 1 then
  colorscheme(fn.readfile(fn.expand("~/.colorscheme"))[1])
else
  colorscheme("moonfly")
end

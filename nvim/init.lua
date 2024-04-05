local colorscheme = vim.cmd.colorscheme
local fn = vim.fn

-- Enable the Lua loader byte-compilation cache.
if fn.has("nvim-0.9") == 1 then
  vim.loader.enable()
end

require("custom.options")
require("custom.mappings")
require("custom.autocmds")
require("custom.filetypes")
require("custom.lazy") -- Plugin Manager

-- Colorscheme, load from a dotfile if it exists.
if fn.filereadable(fn.expand("~/.colorscheme")) == 1 then
  colorscheme(fn.readfile(fn.expand("~/.colorscheme"))[1])
else
  colorscheme("moonfly")
end

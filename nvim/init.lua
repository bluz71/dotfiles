local cmd = vim.cmd
local fn = vim.fn

require("custom.options")  -- Options
require("custom.mappings") -- Mappings
require("plugin.packer")   -- Plugin Manager

cmd([[runtime custom/autocmds.vim]])

-- Colorscheme, load from a dotfile if it exists.
if fn.filereadable(fn.expand("~/.colorscheme")) == 1 then
  cmd([[colorscheme ]] .. fn.readfile(fn.expand('~/.colorscheme'))[1])
else
  cmd([[colorscheme moonfly]])
end

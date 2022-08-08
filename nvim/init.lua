local cmd = vim.cmd
local fn = vim.fn

-------------------------------------------------------------
-- OPTIONS
-------------------------------------------------------------
require("custom.options")


-------------------------------------------------------------
-- FUNCTIONS
--
-- ~/dotfiles/nvim/autoload - custom functions
-------------------------------------------------------------


-------------------------------------------------------------
-- MAPPINGS
-------------------------------------------------------------
require("custom.mappings")
cmd([[runtime custom/mappings.vim]])


-------------------------------------------------------------
-- PLUGINS
-------------------------------------------------------------
require("plugin.packer")

-------------------------------------------------------------
-- AUTOCMDS
-------------------------------------------------------------
cmd([[runtime custom/autocmds.vim]])
    -- ~/dotfiles/nvim/ftplugin       - file type options, mappings
    -- ~/dotfiles/nvim/after/ftplugin - file type overrides


-------------------------------------------------------------
-- COLOR SCHEME
-------------------------------------------------------------
if fn.filereadable(fn.expand("~/.colorscheme")) == 1 then
    cmd("exec 'colorscheme ' . readfile(expand('~/.colorscheme'))[0]")
else
    cmd.colorscheme("moonfly")
end

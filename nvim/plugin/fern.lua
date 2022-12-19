local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set

g["fern#disable_default_mappings"] = 1
g["fern#disable_drawer_smart_quit"] = 1
g["fern#mark_symbol"] = "●"
g["fern#renderer#default#collapsed_symbol"] = "▷ "
g["fern#renderer#default#expanded_symbol"] = "◢ "
g["fern#renderer#default#leading"] = "▏ "
g["fern#renderer#default#leaf_symbol"] = "* "
g["fern#renderer#default#root_symbol"] = "~ "

local opts = { silent = true }
map("n", "<Leader>d", ":Fern . -drawer -width=35 -toggle<CR><C-w>=", opts)
map("n", "<Leader>f", ":Fern . -drawer -reveal=% -width=35<CR><C-w>=", opts)
map("n", "<Leader>.", ":Fern %:h -drawer -width=35<CR><C-w>=", opts)

-- Open directory tree path.
local fern_directory_open = function()
  local path = fn.expand("%:p")

  if fn.isdirectory(path) == 0 then
    return
  end

  cmd([[execute 'Fern ]] .. fn.fnameescape(path) .. "'")
end

-- Let fern handle directory paths instead of Netrw.
local fern_plugin_events = augroup("FernPluginEvents", {})
autocmd("BufEnter", {
  pattern = "*",
  nested = true,
  callback = fern_directory_open,
  group = fern_plugin_events
})

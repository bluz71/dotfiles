local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

-- Let fern handle directory paths instead of Netrw.
autocmd("BufEnter", {
  pattern = "*",
  nested = true,
  callback = function()
    local path = fn.expand("%:p")

    if fn.isdirectory(path) == 0 then
      return
    end

    -- Load up lazy-loaded fern.vim plugin.
    require("lazy").load({ plugins = "fern.vim" })
    -- Launch Fern on the chosen directory.
    vim.cmd([[execute 'Fern ]] .. fn.fnameescape(path) .. "'")
  end,
  group = augroup("FernPluginEvents", {})
})

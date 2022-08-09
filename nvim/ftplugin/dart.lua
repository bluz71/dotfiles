local map = vim.keymap.set
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Hot reload and restart are actions specific to Flutter projects.
vim.cmd([[
  function! FlutterHotReload() abort
      if isdirectory('ios/Flutter')
          silent execute '!kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null'
      endif
  endfunction
  
  function! FlutterHotRestart() abort
      if isdirectory('ios/Flutter')
          silent execute '!kill -SIGUSR2 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null'
      endif
  endfunction
]])

local opts = { buffer = true, silent = true }
map("n", "'h", ":call FlutterHotReload()<CR>:echo 'Flutter reloaded'<CR>", opts)
map("n", "'H", ":call FlutterHotRestart()<CR>:echo 'Flutter restarted'<CR>", opts)

-- Automatically hot-reload Flutter Dart files when saving.
local dart_type_events = augroup("DartTypeEvents", {})
autocmd("BufWritePost", {
  pattern = "*.dart",
  command = "call FlutterHotReload()",
  group = dart_type_events,
})

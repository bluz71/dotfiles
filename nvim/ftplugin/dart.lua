local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local fn = vim.fn
local map = vim.keymap.set

-- Hot reload and restart are actions specific to Flutter projects.
function flutter_hot_reload()
  if fn.isdirectory("ios/Flutter") ~= 0 then
    cmd([[silent execute '!kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null']])
  end
end

function flutter_hot_restart()
  if fn.isdirectory("ios/Flutter") ~= 0 then
    cmd([[silent execute '!kill -SIGUSR2 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null']])
  end
end

local opts = { buffer = true, silent = true }
map("n", "'h", "<cmd>lua flutter_hot_reload()<CR>:echo 'Flutter reloaded'<CR>", opts)
map("n", "'H", "<cmd>lua flutter_hot_restart()<CR>:echo 'Flutter restarted'<CR>", opts)

-- Automatically hot-reload Flutter Dart files when saving.
local dart_type_events = augroup("DartTypeEvents", {})
autocmd("BufWritePost", {
  pattern = "*.dart",
  command = "call FlutterHotReload()",
  group = dart_type_events,
})

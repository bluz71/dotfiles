local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

local opts = { buffer = true, silent = true }
map("n", "'h", require("util.flutter").hot_reload, opts)
map("n", "'H", require("util.flutter").hot_restart, opts)

-- Automatically hot-reload Flutter Dart files when saving.
local dart_type_events = augroup("DartTypeEvents", {})
autocmd("BufWritePost", {
  pattern = "*.dart",
  command = "call FlutterHotReload()",
  group = dart_type_events,
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set
local opt = vim.opt
local opt_local = vim.opt_local

local custom_events = augroup("CustomEvents", {})

-- Style customizations.
autocmd("WinEnter", {
  callback = function()
    require("util.window-traits").activity(true)
  end,
  group = custom_events,
})

autocmd("WinLeave", {
  callback = function()
    require("util.window-traits").activity(false)
  end,
  group = custom_events,
})

autocmd("VimEnter", {
  callback = function()
    require("util.diff").styling()
  end,
  group = custom_events,
})

-- Restore default Enter/Return behaviour for the command line window.
autocmd("CmdwinEnter", {
  callback = function()
    map("n", "<CR>", "<CR>", { buffer = true })
  end,
  group = custom_events,
})

-- Automatically equalize window splits.
autocmd("VimResized", {
  command = "wincmd =",
  group = custom_events,
})

-- Set filetype for certain file-patterns.
autocmd("BufEnter", {
  pattern = "gitconfig",
  callback = function()
    opt.filetype = "gitconfig"
  end,
  group = custom_events,
})

autocmd("BufEnter", {
  pattern = "*.json.jbuilder",
  callback = function()
    opt.filetype = "ruby"
  end,
  group = custom_events,
})

autocmd("BufEnter", {
  pattern = "fonts.conf",
  callback = function()
    opt.filetype = "xml"
  end,
  group = custom_events,
})

autocmd("BufEnter", {
  pattern = "*.astro",
  callback = function()
    opt.filetype = "astro"
  end,
  group = custom_events,
})

-- Enable MatchTag plugin for certain HTML-like filetypes.
autocmd("FileType", {
  pattern = { "javascript" },
  command = "unlet b:did_ftplugin | runtime! ftplugin/html.vim",
  group = custom_events,
})
autocmd("FileType", {
  pattern = { "astro" },
  command = "runtime! ftplugin/html.vim",
  group = custom_events,
})

-- Automatically open the quickfix window after executing a grep operation.
autocmd("QuickFixCmdPost", {
  pattern = "grep",
  command = "cwindow",
  group = custom_events,
})

-- Auto-read external file changes, compliments the vim-auto-save plugin.
autocmd("CursorHold", {
  command = "silent! checktime",
  group = custom_events,
})

-- Terminal settings.
autocmd("TermOpen", {
  callback = function()
    opt_local.conceallevel = 0
    opt_local.colorcolumn = { 0 }
    cmd([[startinsert]])
  end,
  group = custom_events,
})

autocmd("BufEnter", {
  pattern = "term://*",
  command = "startinsert",
  group = custom_events,
})

-- Yank event processing.
autocmd("TextYankPost", {
  callback = function()
    -- Highlight the selected yank.
    vim.highlight.on_yank({ higroup = "Visual", on_visual = false, timeout = 300 })
    -- Copy yanked text to a tmux paste buffer if tmux is active.
    if vim.env.TMUX and vim.v.operator == "y" then
      local _, yank_data = pcall(fn.getreg, "0")
      fn.system({ "tmux", "set-buffer", yank_data })
    end
  end,
  group = custom_events,
})

-- Override filetype specific 'formatoptions'.
autocmd("FileType", {
  callback = function()
    -- Enable preferred options.
    opt_local.formatoptions:prepend("t")
    -- Disable unwanted options.
    opt_local.formatoptions:remove({ "r", "o", "l" })
  end,
  group = custom_events,
})

-- Colorscheme overrides.
autocmd("ColorScheme", {
  pattern = "nightfly",
  callback = function()
    -- Tweak terminal colors to make lazygit look nicer.
    g.terminal_color_9  = "#fc514e" -- Bright Red
    g.terminal_color_10 = "#a1cd5e" -- Bright Green
    g.terminal_color_11 = "#e3d18a" -- Bright Yellow
    g.terminal_color_13 = "#c792ea" -- Bright Magenta
  end,
  group = custom_events,
})

autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
    -- Tweak terminal colors to make lazygit look nicer.
    g.terminal_color_9  = "#ff5454" -- Bright Red
    g.terminal_color_10 = "#8cc85f" -- Bright Green
    g.terminal_color_11 = "#e3c78a" -- Bright Yellow
    g.terminal_color_12 = "#80a0ff" -- Bright Blue
    g.terminal_color_13 = "#cf87e8" -- Bright Magenta
    g.terminal_color_14 = "#79dac8" -- Bright Cyan
  end,
  group = custom_events,
})

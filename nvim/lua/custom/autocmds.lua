local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local getreg = vim.fn.getreg
local highlight = vim.api.nvim_set_hl
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
  pattern = "pryrc",
  callback = function()
    opt.filetype = "ruby"
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
      local yanked_text = getreg('"')
      fn.system({ "tmux", "set-buffer", yanked_text })
    end
    -- Copy yanked text from remote host to local clipboard via OSC 52 when in an SSH tunnel.
    if vim.env.SSH_CONNECTION and vim.v.operator == "y" then
      local yanked_text = getreg('"')
      require("util.osc52").copy(yanked_text)
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
  pattern = "default",
  callback = function()
    highlight(0, "ColorColumn", { link = "Folded" })
    highlight(0, "Comment", { fg = "NvimLightGrey4", italic = true })
    highlight(0, "FloatBorder", { link = "WinSeparator" })
    highlight(0, "NeoTreeDirectoryIcon", { link = "SignColumn" })
    highlight(0, "NeoTreeDirectoryName", { link = "Identifier" })
    highlight(0, "NeoTreeRootName", { link = "String" })
    highlight(0, "NonText", { link = "SignColumn" })
    highlight(0, "NormalFloat", { link = "Normal" })
  end,
  group = custom_events,
})

autocmd("ColorScheme", {
  pattern = { "catppuccin", "nightfox", "retrobox" },
  callback = function()
    highlight(0, "SnacksPicker", { link = "Normal" })
  end,
  group = custom_events,
})

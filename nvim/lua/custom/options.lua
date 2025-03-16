local env = vim.env
-- local exists = vim.fn.exists
local fn = vim.fn
local g = vim.g
local git_repo = vim.env.GSF_REPOSITORY
local opt = vim.opt

opt.autoindent = true -- Indented text
opt.autoread = true -- Pick up external changes to files
opt.autowrite = true -- Write files when navigating with :next/:previous
opt.background = "dark" -- Dark background by default
opt.backup = false -- No backup files
opt.belloff = "all" -- Bells are annoying
opt.breakindent = true -- Wrap long lines *with* indentation
opt.breakindentopt = "shift:2"
-- Enable copy to/from local system clipboard
if not vim.env.SSH_CONNECTION then
  if fn.has("unnamedplus") == 1 then
    opt.clipboard = { "unnamed", "unnamedplus" }
  else
    opt.clipboard = "unnamed"
  end
  -- Note, SSH connections will use OSC 52 copy.
end
opt.cmdheight = 1
opt.colorcolumn = { 81, 82 } -- Highlight 81 and 82 columns
opt.conceallevel = 0 -- Always show text normally
opt.complete = { ".", "w", "b" } -- Sources for term and line completions
opt.completeopt = { "menu", "menuone", "noselect" }
-- Highlight the current line in the number column.
opt.cursorline = true
opt.cursorlineopt = "number"
opt.dictionary = "/usr/share/dict/words"
opt.diffopt = { "internal", "filler", "algorithm:histogram", "indent-heuristic", "linematch:60" }
opt.expandtab = true -- Use spaces instead of tabs
opt.exrc = false -- Disable reading of working directory vimrc files
-- Lua initialization file
opt.fillchars = {
  horiz = "━", horizup = "┻", horizdown = "┳", vert = "┃", vertleft = "┫",
  vertright = "┣", verthoriz = "╋",
  fold = "━", foldclose = "▷", foldopen = "▼", foldsep = "┃",
  diff = "",
}
opt.foldlevelstart = 20
opt.foldmethod = "indent" -- Simple and fast
opt.foldtext = ""
opt.formatoptions = "tcqj"
opt.gdefault = true -- Always do global substitutes
-- Use ripgrep as the grep tool
opt.grepprg = "rg --vimgrep --smart-case"
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
opt.history = 999 -- Keep 999 changes of undo history
opt.hlsearch = false -- Don't highlight search results by default
opt.infercase = true -- Smart casing when completing
opt.ignorecase = true -- Search in case-insensitively
opt.incsearch = true -- Go to search results immediately
opt.joinspaces = false -- No to double-spaces when joining lines
opt.laststatus = 3 -- We want a global statusline
opt.list = true
opt.listchars = {
  tab = "  ", trail = "‧",
  extends = "»", precedes = "«",
}
opt.matchpairs = "(:),{:},[:]"
-- if exists("&messagesopt") ~= 0 then
--   opt.messagesopt = { wait = 500, history = 500 }
-- end
opt.mouse = "a" -- Mouse support in the terminal
opt.number = true -- Show line numbers
if fn.has("nvim-0.11") == 1 and git_repo == "1" then
  opt.numberwidth = 3
end
opt.nrformats = "" -- No to oct/hex support when doing CTRL-a/x
opt.path = "**" -- File search path
opt.pumheight = 20 -- Height of complete list
opt.relativenumber = true -- Show relative numbers
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftwidth = 2 -- Default indentation amount
-- Setup shared-data.
opt.shada = { "'300", "<50", "s10", "h" }
-- Don't show certain messages.
opt.shortmess = opt.shortmess + {
  c = true, s = true, C = true, F = true, I = true, S = true, W = true
}
opt.showbreak = "↳" -- Use this to wrap long lines
opt.showcmd = false -- No to showing command in bottom-right corner
opt.showmatch = false -- No jumping jumping cursors when matching pairs
opt.showmode = false -- No to showing mode in bottom-left corner
if fn.has("nvim-0.11") == 1 and git_repo == "1" then
  opt.signcolumn = "yes:1"
else
  opt.signcolumn = "number"
end
opt.smartcase = true -- Case-smart searching
opt.smarttab = true -- Tab at the start of line inserts blanks
opt.smoothscroll = true -- Scroll by screen line
-- When spell checking, assume word boundaries include 'CamelCasing'
opt.spelloptions = "camel"
opt.splitbelow = true -- Split below current window
-- When horizonatally splitting windows keep text stabilized (no auto-scrolling)
opt.splitkeep = "topline"
opt.splitright = true -- Split window to the right
if fn.has("nvim-0.11") == 1 and git_repo == "1" then
  opt.statuscolumn = "%l%s"
end
opt.swapfile = false -- No backup files
opt.tabstop = 4 -- Tab width
opt.textwidth = 80 -- Standard width before breaking
opt.timeoutlen = 1500 -- Give some time for multi-key mappings
-- Don't set ttimeoutlen to zero otherwise it will break some Vim terminal
-- behaviours
opt.ttimeoutlen = 10
-- Set the persistent undo directory on temporary private fast storage.
local undo_dir = "/tmp/.nvim_undodir_" .. env.USER
if fn.isdirectory(undo_dir) ~= 1 then
  fn.mkdir(undo_dir, "", "0700")
end
opt.undodir = undo_dir
opt.undofile = true -- Maintain undo history
opt.updatetime = 1000 -- Certain plugins use this for CursorHold event triggering
-- Defines the trigger for 'wildmenu' in mappings, refer to: https://is.gd/Wpa4IU
opt.wildcharm = fn.char2nr("	")
opt.wildmenu = true -- Nice command completions
opt.wildmode = "full" -- Complete the next full match
opt.wrap = true -- Wrap long lines
opt.wrapscan = false -- Don't wrap searches around

-- Don't load these language providers since they needlessly slow down the loading
-- of those same language files into the editor.
g.loaded_node_provider = 1
g.loaded_python3_provider = 1
g.loaded_ruby_provider = 1

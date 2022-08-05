local g = vim.g
local map = vim.keymap.set

g.undotree_HighlightChangedWithSign = 0
g.undotree_WindowLayout = 4
g.undotree_SetFocusWhenToggle = 1

local opts = { silent = true }
map("n", "'u", ":UndotreeToggle<CR>", opts)

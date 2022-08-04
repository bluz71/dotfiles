g = vim.g
map = vim.keymap.set

g.tmux_navigator_no_mappings = 1

if vim.env.TMUX ~= nil then
  -- Seamless Alt-h/j/k/l navigation between Vim splits  and tmux panes.
  -- Note, only set up mappings if running inside tmux.
  local opts = { silent = true }
  map("n", "A-h", ":TmuxNavigateLeft<CR>")
  map("n", "A-r", ":TmuxNavigateDown<CR>")
  map("n", "A-t", ":TmuxNavigateUp<CR>")
  map("n", "A-l", ":TmuxNavigateRight<CR>")
end

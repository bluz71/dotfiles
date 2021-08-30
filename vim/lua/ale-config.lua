-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

vim.g.ale_fixers = {
  css = {'prettier'},
  dart = {'dartfmt'},
  javascript = {'prettier-standard'},
  json = {'prettier'},
  ruby = {'standardrb'},
  scss = {'prettier'},
  yml = {'prettier'},
}

vim.g.ale_linters = {
  css = {'csslint'},
  eruby = {'erb'},
  javascript = {'standard'},
  json = {'jsonlint'},
  markdown = {'mdl'},
  ruby = {'standardrb'},
  scss = {'sasslint'},
  yaml = {'yamllint'},
}

vim.g.ale_completion_enabled = 0
vim.g.ale_echo_cursor = 0
vim.g.ale_fix_on_save = 0
vim.g.ale_floating_preview = 1
vim.g.ale_floating_window_border = {'│', '─', '┌', '┐', '┘', '└'}
vim.g.ale_hover_cursor = 0
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_filetype_changed = 0
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_linters_explicit = 1
vim.g.ale_open_list = 0
vim.g.ale_sign_error = '▷'
vim.g.ale_sign_info = '▷'
vim.g.ale_sign_priority = 9
vim.g.ale_sign_warning = '▷'
vim.g.ale_virtualtext_cursor = 1
vim.g.ale_virtualtext_prefix = ' ▷ '

-- ALE fix and toggle mappings.
local map = vim.api.nvim_set_keymap
local opts = {silent = true}
map('n', "'f", '<Plug>(ale_fix)', opts)
map('n', "'a", '<Plug>(ale_toggle_buffer)', opts)
map('n', "'A", '<Plug>(ale_toggle)', opts)
map('n', "'w", '<Plug>(ale_detail)', opts)
-- Navigate errors and warnings using unimpaired-style mappings.
map('n', '[w', '<Plug>(ale_previous)zz', opts)
map('n', ']w', '<Plug>(ale_next)zz', opts)
map('n', '[W', '<Plug>(ale_first)zz', opts)
map('n', ']W', '<Plug>(ale_last)zz', opts)

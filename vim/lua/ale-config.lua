-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local g = vim.g
g.ale_fixers = {
  css = {'prettier'},
  dart = {'dartfmt'},
  javascript = {'prettier-standard'},
  json = {'prettier'},
  ruby = {'standardrb'},
  scss = {'prettier'},
  yml = {'prettier'},
}

g.ale_linters = {
  css = {'csslint'},
  eruby = {'erb'},
  javascript = {'standard'},
  json = {'jsonlint'},
  markdown = {'mdl'},
  ruby = {'standardrb'},
  scss = {'sasslint'},
  yaml = {'yamllint'},
}

g.ale_completion_enabled = 0
g.ale_echo_cursor = 0
g.ale_fix_on_save = 0
g.ale_floating_preview = 1
g.ale_floating_window_border = {'│', '─', '┌', '┐', '┘', '└'}
g.ale_hover_cursor = 0
g.ale_lint_on_enter = 0
g.ale_lint_on_filetype_changed = 0
g.ale_lint_on_insert_leave = 0
g.ale_lint_on_save = 1
g.ale_lint_on_text_changed = 'never'
g.ale_linters_explicit = 1
g.ale_open_list = 0
g.ale_sign_error = '▷'
g.ale_sign_info = '▷'
g.ale_sign_priority = 9
g.ale_sign_warning = '▷'
g.ale_virtualtext_cursor = 1
g.ale_virtualtext_prefix = ' ▷ '

-- ALE fix and toggle mappings.
local map = vim.api.nvim_set_keymap
local opts = {silent = true}
map('n', "'f", '<Plug>(ale_fix)', opts)
map('n', "'a", '<Plug>(ale_toggle_buffer)', opts)
map('n', "'w", '<Plug>(ale_detail)', opts)
-- Navigate errors and warnings using unimpaired-style mappings.
map('n', '[w', '<Plug>(ale_previous)zz', opts)
map('n', ']w', '<Plug>(ale_next)zz', opts)
map('n', '[W', '<Plug>(ale_first)zz', opts)
map('n', ']W', '<Plug>(ale_last)zz', opts)

local g = vim.g

-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  g.ale_enabled = false
  return
end

g.ale_fixers = {
  css = { "prettier" },
  dart = { "dart-format" },
  fish = { "fish_indent" },
  html = { "prettier" },
  javascript = { "standard" }, -- PR - conform.nvim
  json = { "prettier" },
  jsonc = { "prettier" },
  lua = { "stylua" },
  scss = { "prettier" },
  svelte = { "prettier" },
  typescript = { "prettier" },
  yml = { "prettier" },
}

g.ale_linters = {
  eruby = {'erblint'},
  javascript = {'standard'}, -- PR - nvim-lint
  lua = { "selene" },
  json = { "jsonlint" },
  markdown = { "mdl" }, -- PR - nvim-lint
  yaml = { "yamllint" },
}

g.ale_completion_enabled = 0
g.ale_echo_cursor = 0
g.ale_fix_on_save = 0
g.ale_hover_cursor = 0
g.ale_lint_on_enter = 0
g.ale_lint_on_filetype_changed = 0
g.ale_lint_on_insert_leave = 0
g.ale_lint_on_save = 1
g.ale_lint_on_text_changed = "never"
g.ale_linters_explicit = 1
g.ale_maximum_file_size = 102400 -- 100KB
g.ale_use_neovim_diagnostics_api = 1

-- ALE fix mapping.
vim.api.nvim_set_keymap("n", "'f", "<Plug>(ale_fix)", { silent = true })

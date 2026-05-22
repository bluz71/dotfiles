vim.g.linefly_options = {
  active_tab_symbol = "🬃",
  error_symbol = "■",
  warning_symbol = "△",
  information_symbol = "○",
  tabline = true,
  winbar = vim.env.NVIM_GIT_DIFF ~= "1",
  with_lsp_status = true,
  with_search_count = true,
  with_spell_status = true,
  with_indent_status = true,
}

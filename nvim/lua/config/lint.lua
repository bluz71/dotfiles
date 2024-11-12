-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local lint = require("lint")
local linters = require("lint").linters
local buffer = require("util.buffer")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

lint.linters_by_ft = {
  eruby = { "htmlhint" },
  lua = { "selene" },
  json = { "jsonlint" },
  markdown = { "markdownlint" },
}

-- Custom linter arguments for 'markdownlint'.
linters.markdownlint.args = {
  "--stdin",
  "--config",
  "~/dotfiles/linter_configs/markdownlint.json",
  "--disable",
  "MD013", -- disable line length limit
  "MD024", -- allow multiple headings with the same comment
  "MD030", -- allow spaces after list markers
  "MD033", -- allow inline HTML
  "MD036", -- allow emphasis blocks
  "MD040", -- allow code blocks without language specification
  "MD041", -- allow non-headers on the first line, e.g. meta section
  "MD046", -- allow mixed code-block styles
  "--",
}

-- Custom linter for eRuby files, uses htmlhint with ERB tags stripped out.
lint.linters.htmlhint = {
  cmd = "htmlhint-erb", -- PATH script: sed -z 's/<%[^>]*%>//g' $1 | htmlhint stdin -f compact | head -n 1
  stdin = true,
  stream = "stdout",
  ignore_exitcode = true,
  parser = require("lint.parser").from_pattern(
    ".*: line (%d+), col (%d+), (%a+) %- (.+)",
    { "lnum", "col", "severity", "message" },
    { vim.diagnostic.severity.ERROR },
    { source = "htmlhint" }
  ),
}

-- Trigger linting on the following buffer events.
autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    -- Do not lint files larger than 100KB.
    if buffer.is_large(0) then
      return
    end
    lint.try_lint()
  end,
  group = augroup("NvimLintPluginEvents", {}),
})

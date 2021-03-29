local util = require 'vim.lsp.util'

local M = {}

-- Custom diagnostic handler.
M.diagnostic = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {
      severity_limit = 'Warning',
    },
    underline = false,
    update_in_insert = false,
    virtual_text = {
      spacing = 2,
      severity_limit = 'Warning',
    },
  }
)

-- Empty diagnostic handler.
M.none_diagnostic = function() end

-- Custom hover handler which deviates from the Neovim default by limiting the
-- hover width to a maximum of 85% of the screen width.
M.hover = function(_, method, result)
  util.focusable_float(method, function()
    if not (result and result.contents) then
      -- return { 'No information available' }
      return
    end
    local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      -- return { 'No information available' }
      return
    end
    local columns = vim.api.nvim_get_option('columns')
    local hover_width = math.ceil(columns * 0.85)
    local bufnr, winnr = util.fancy_floating_markdown(markdown_lines, {
      pad_left = 1; pad_right = 1; max_width = hover_width;
    })
    util.close_preview_autocmd({"CursorMoved", "BufHidden", "InsertCharPre"}, winnr)
    return bufnr, winnr
  end)
end

return M

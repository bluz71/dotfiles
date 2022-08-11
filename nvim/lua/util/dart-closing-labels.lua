-- Copied from:
--   https://github.com/nvim-lua/lsp_extensions.nvim/blob/master/lua/lsp_extensions/dart/closing_labels.lua

local buf_set_virtual_text = vim.api.nvim_buf_set_virtual_text

local M = {}

-- Namespace for the virtual text.
local closing_labels_ns = vim.api.nvim_create_namespace("dart-closing-labels")

-- Draw the newly published labels in the current buffer.
local render_labels = function(labels)
  local highlight
  highlight = "DiagnosticVirtualTextHint"
  local prefix = "›› "

  vim.api.nvim_buf_clear_namespace(0, closing_labels_ns, 0, -1)

  for _, label in ipairs(labels) do
    local end_line = label.range["end"].line
    local text = prefix .. label.label
    buf_set_virtual_text(0, closing_labels_ns, end_line, { { text, highlight } }, {})
  end
end

-- Dart Analysis Server publishClosingLabels handler.
M.handler = function()
  return function(_, result, _, _)
    local uri = result.uri
    local labels = result.labels
    -- Prevent stray events from over-writing labels that don't match the
    -- current buffer.
    if uri == vim.uri_from_bufnr(0) then
      render_labels(labels)
    end
  end
end

return M

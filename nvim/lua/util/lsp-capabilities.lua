-- Copied from:
--   https://github.com/hrsh7th/cmp-nvim-lsp/blob/main/lua/cmp_nvim_lsp/init.lua

local M = {}

M.update_capabilities = function(capabilities)
  local completionItem = capabilities.textDocument.completion.completionItem

  completionItem.snippetSupport = true
  completionItem.preselectSupport = true
  completionItem.insertReplaceSupport = true
  completionItem.labelDetailsSupport = true
  completionItem.deprecatedSupport = true
  completionItem.commitCharactersSupport = true
  completionItem.tagSupport = { valueSet = { 1 } }
  completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

return M

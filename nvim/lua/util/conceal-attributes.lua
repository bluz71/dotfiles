--- Conceal HTML class attributes, especially Tailwind CSS class utilities.
--- Reference: https://gist.github.com/mactep/430449fd4f6365474bfa15df5c02d27b

local opt_local = vim.opt_local
local treesitter = vim.treesitter

local M = {}

M.fold = function()
  -- Exit early if this is not a Tailwind CSS project.
  local ok, tailwind_config = pcall(io.open, "tailwind.config.mjs", "r")
  if ok and tailwind_config then
    tailwind_config:close()
    -- Fall through.
  else
    return
  end

  -- Enable 'conceallevel' option, this will do the actual hidding of HTML class
  -- attributes.
  opt_local.conceallevel = 2

  local bufnr = vim.api.nvim_get_current_buf()
  local conceal_ns = vim.api.nvim_create_namespace("class_conceal")
  local language_tree = treesitter.get_parser(bufnr, "html")
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()

  local query = [[
    ((attribute
      (attribute_name) @att_name (#eq? @att_name "class")
      (quoted_attribute_value (attribute_value) @class_value) (#set! @class_value conceal "‥")))
  ]]

  local ts_query
  ok, ts_query = pcall(treesitter.query.parse, "html", query)
  if not ok then
    return
  end

  for _, captures, metadata in ts_query:iter_matches(root, bufnr, root:start(), root:end_(), {}) do
    local start_row, start_col, end_row, end_col = captures[2]:range()
    -- This conditional prevents conceal leakage if the class attribute is erroneously formed.
    if (end_row - start_row) == 0 then
      vim.api.nvim_buf_set_extmark(bufnr, conceal_ns, start_row, start_col, {
        end_line = end_row,
        end_col = end_col,
        conceal = metadata[2].conceal,
      })
    end
  end
end

return M

local feedkeys = vim.fn.feedkeys

local replace_termcodes = function(key)
  return vim.api.nvim_replace_termcodes(key, true, true, true)
end

local is_whitespace = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

local M = {}

M.tab = function()
  if is_whitespace() then
    -- Insert an actual TAB character since the preceeding character is a
    -- whitespace.
    feedkeys(replace_termcodes("<Tab>"), "n")
    return
  end

  -- Feed through to Control-next.
  feedkeys(replace_termcodes("<C-n>"), "n")
end

M.shift_tab = function()
  if is_whitespace() then
    -- Do nothing.
    return
  end

  -- Feed through to Control-previous.
  feedkeys(replace_termcodes("<C-p>"), "n")
end

return M

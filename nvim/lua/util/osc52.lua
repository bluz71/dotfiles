local M = {}

-- Note, this function exists because I could not get Neovim's OSC 52 to work (I don't know why).
M.copy = function(text)
  -- Convert to base64 as required by OSC 52.
  local encoded = vim.base64.encode(text)

  -- And send the OSC 52 sequence directly to the terminal.
  local osc = string.format('\027]52;c;%s\007', encoded)
  vim.fn.chansend(vim.v.stderr, osc)
end

return M

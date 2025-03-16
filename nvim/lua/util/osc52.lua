local M = {}

-- Note, this function exists only because I could not get Neovim's native OSC 52 to work. Maybe in
-- future I can remove this, see: https://neovim.io/doc/user/provider.html#clipboard-osc52
M.copy = function(text)
  -- Convert to base64 as required by OSC 52.
  local encoded = vim.base64.encode(text)

  -- And then send the OSC 52 sequence directly to the terminal.
  local osc = string.format('\027]52;c;%s\007', encoded)
  vim.fn.chansend(vim.v.stderr, osc)
end

return M

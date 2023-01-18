local cmd = vim.cmd
local fn = vim.fn

local M = {}

M.hot_reload = function()
  if fn.isdirectory("ios/Flutter") ~= 0 then
    cmd([[silent execute '!kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null']])
    print("(Flutter) RELOADED")
  end
end

M.hot_restart = function()
  if fn.isdirectory("ios/Flutter") ~= 0 then
    cmd([[silent execute '!kill -SIGUSR2 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null']])
    print("(Flutter) RESTARTED")
  end
end

return M

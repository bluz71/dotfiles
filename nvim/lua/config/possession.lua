local possession = require("possession")
local session = require('possession.session')
local cmd = vim.cmd
local map = vim.keymap.set

possession.setup({})

map("n", "'p", function()
  local session_name = session.session_name
  if session_name and string.len(session_name) > 0 then
    cmd([[:PossessionSave!]])
  else
    session_name = vim.fn.input("session name: ")
    if session_name and string.len(session_name) > 0 then
      cmd([[:PossessionSave ]] .. session_name)
    else
      print("Aborting session creation")
    end
  end
end)

map("n", "'P", function()
  local session_name = session.session_name
  if session_name and string.len(session_name) > 0 then
    cmd([[:PossessionDelete]])
  end
end)

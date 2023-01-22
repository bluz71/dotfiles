local buf_get_option = vim.api.nvim_buf_get_option
local opt = vim.opt
local opt_local = vim.opt_local

local M = {}

-- Render active windows differently to inactive windows.
--
-- In inactive windows disable the following traits: color column, relative line
-- numbers and sign column.
M.activity = function(active)
  if opt.diff:get() or buf_get_option(0, "buftype") == "nofile" or buf_get_option(0, "filetype") == "lazygit" then
    -- Do nothing for diffs and certain special files.
    return
  end

  if active then -- Active window
    opt_local.colorcolumn = "81,82"
    opt_local.cursorline = true
    -- Do not update the number column for help files.
    if buf_get_option(0, "filetype") ~= "help" then
      if vim.fn.has("nvim-0.9") == 1 then
        opt_local.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"
      else
        opt_local.relativenumber = true
      end
    end
  else -- Inactive window
    opt_local.colorcolumn = "0"
    opt_local.cursorline = false
    if vim.fn.has("nvim-0.9") == 1 then
      opt_local.statuscolumn = "%=%l%=%s"
    else
      opt_local.relativenumber = false
      opt_local.signcolumn = "no"
    end
  end
end

return M

local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")

local M = {}

M.git_bcommits = function()
  local opts = {}
  opts.previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
      return {
        "git", "-c", "core.pager=delta", "-c", "delta.pager=less -R", "show", entry.value,
      }
    end,
  })

  builtin.git_bcommits({})
end

M.git_status = function()
  local opts = {}
  opts.previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
      if entry.status == "D " then
        return { "git", "show", "HEAD:" .. entry.value }
      elseif entry.status == "??" then
        return { "bat", "--style=plain", entry.value }
      end
      return {
        "git", "-c", "core.pager=delta", "-c", "delta.pager=less -R", "diff", entry.value,
      }
    end,
  })

  -- Use icons that resemble the `git status` command line.
  opts.git_icons = {
    added = "A",
    changed = "M",
    copied = "C",
    deleted = "-",
    renamed = "R",
    unmerged = "U",
    untracked = "?",
  }

  builtin.git_status(opts)
end

return M

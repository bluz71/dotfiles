local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local fn = vim.fn

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

M.themes = function()
  -- Load up lazy-loaded plugin themes.
  vim.cmd("Lazy load catppuccin kanagawa.nvim nightfox.nvim tokyonight.nvim")

  local themes_to_ignore = {
    "blue", "catppuccin-frappe", "catppuccin-latte", "carbonfox", "catppuccin-macchiato",
    "catppuccin-mocha", "darkblue", "dawnfox", "dayfox", "delek", "desert", "duskfox", "elflord",
    "evening", "habamax", "industry", "kanagawa-lotus", "kanagawa-dragon", "kanagawa-wave",
    "koehler", "lunaperche", "morning", "murphy", "nordfox", "pablo", "peachpuff", "quiet", "ron",
    "shine", "slate", "sorbet", "terafox", "tokyonight-day", "tokyonight-moon", "tokyonight-night",
    "tokyonight-storm", "torte", "vim", "wildcharm", "zaibatsu", "zellner",
  }

  -- Save existing completion.
  local target = fn.getcompletion

  -- Filter themes, ignore the above listed themes.
  fn.getcompletion = function()
    return vim.tbl_filter(function(color)
      return not vim.tbl_contains(themes_to_ignore, color)
    end, target("", "color"))
  end

  builtin.colorscheme({ enable_preview = true })

  -- Reset original completion.
  fn.getcompletion = target
end

return M

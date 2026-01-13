local treesitter = require("nvim-treesitter")
local buffer = require("util.buffer")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

treesitter.install({
  "astro", "bash", "c", "clojure", "cpp", "css", "dart", "diff", "elixir", "embedded_template",
  "fish", "git_rebase", "gitcommit", "go", "haskell", "html", "java", "javascript", "json", "julia",
  "lua", "markdown", "markdown_inline", "php", "python", "r", "rbs", "regex", "ruby", "rust",
  "scala", "scss", "svelte", "tmux", "toml", "tsx", "typescript", "vim", "vimdoc", "vue", "zig",
})

-- Add Crystal Tree-sitter parser which is currently resides outside of the nvim-treesitter plugin.
autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require('nvim-treesitter.parsers').crystal = {
      install_info = {
        url = "https://github.com/crystal-lang-tools/tree-sitter-crystal",
        queries = "queries/nvim",
      },
    }
  end,
})
vim.treesitter.language.register("crystal", { "cr" })

autocmd("FileType", {
  pattern = {
    "astro", "c", "clojure", "cpp", "crystal", "css", "dart", "elixir", "eruby", "fish", "gitcommit",
    "go", "haskell", "html", "java", "javascript", "json", "julia", "lua", "markdown", "php",
    "python", "r", "ruby", "rust", "scala", "scss", "sh", "svelte", "tmux", "toml", "typescript",
    "typescriptreact", "vim", "vue", "zig",
  },
  callback = function(event)
    local buf = event.buf
    if buffer.is_large(buf) then
      -- Do NOT enable Tree-sitter for large files.
      return
    end
    vim.treesitter.start()
    local filetype = event.match
    if filetype == "html" or filetype == "ruby" or filetype == "rust" then
      -- Do NOT enable indent for certain filetypes.
      return
    end
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
  group = augroup("TreesitterEvents", {}),
})

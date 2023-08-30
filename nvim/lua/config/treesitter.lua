local treesitter = require("nvim-treesitter.configs")
local buffer = require("util.buffer")

treesitter.setup({
  ensure_installed = {
    "astro", "bash", "c", "clojure", "cpp", "css", "dart", "elixir", "elm",
    "embedded_template", "go", "haskell", "html", "java", "javascript",
    "julia", "lua", "markdown", "markdown_inline", "php", "python", "r",
    "regex", "ruby", "rust", "scala", "scss", "svelte", "toml", "tsx",
    "typescript", "vim", "vimdoc", "vue",
  },
  highlight = {
    enable = true,
    disable = function(_, buf)
      if buffer.is_large(buf) then
        return true
      end
    end,
  },
  incremental_selection = {
    enable = false,
  },
  indent = {
    enable = true,
    disable = function(lang, buf)
      if
        lang == "html"
        or lang == "ruby"
        or lang == "rust"
        or buffer.is_large(buf)
      then
        -- Disable indent for certain filetypes AND also for large files.
        return true
      end
    end,
  },

  -- For nvim-autotag plugin.
  autotag = {
    enable = true,
    filetypes = {
      "html", "javascript", "typescript", "svelte", "eruby", "embedded_template",
    },
  },
  -- For nvim-ts-context-commentstring plugin.
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- For nvim-treesitter-endwise plugin.
  endwise = {
    enable = true,
  },
})

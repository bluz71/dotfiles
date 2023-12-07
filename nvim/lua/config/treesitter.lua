local treesitter = require("nvim-treesitter.configs")
local commentstring = require("ts_context_commentstring")
local buffer = require("util.buffer")

treesitter.setup({
  -- No need to ensure_installed the following parsers.
  --
  -- Neovim 0.9 ships: c, lua, vim & vimdoc parsers
  -- Neovim 0.10 ships: bash, c, lua, markdown, markdown_inline, python, vim &
  --                    vimdoc parsers
  ensure_installed = {
    "astro", "bash", "clojure", "cpp", "css", "dart", "elixir", "elm",
    "embedded_template", "go", "haskell", "html", "java", "javascript", "julia",
    "markdown", "markdown_inline", "php", "python", "r", "regex", "ruby",
    "rust", "scala", "scss", "svelte", "toml", "tsx", "typescript", "vue",
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
      if lang == "html" or lang == "ruby" or lang == "rust" or buffer.is_large(buf) then
        -- Disable indent for certain filetypes & large files.
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
  -- For nvim-treesitter-endwise plugin.
  endwise = {
    enable = true,
  },
})

-- For nvim-ts-context-commentstring plugin.
commentstring.setup({
  enable_autocmd = false,
})

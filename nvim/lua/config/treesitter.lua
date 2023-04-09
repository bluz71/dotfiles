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
      if lang == "ruby" or lang == "rust" or buffer.is_large(buf) then
        -- Disable indent for Ruby, Rust files AND also for large files.
        return true
      end
    end,
  },

  -- For nvim-treesitter-textobjects plugin.
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
      },
    },
  },
  -- For nvim-autotag plugin.
  autotag = {
    enable = true,
    filetypes = {
      "html", "javascript", "typescript", "svelte", "vue", "astro", "eruby",
      "embedded_template",
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

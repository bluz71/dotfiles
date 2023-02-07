local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "astro", "bash", "c", "clojure", "comment", "cpp", "css", "dart", "elixir",
    "elm", "embedded_template", "go", "haskell", "help", "html", "java",
    "javascript", "julia", "lua", "markdown", "markdown_inline", "php",
    "python", "r", "regex", "ruby", "rust", "scala", "scss", "svelte", "toml",
    "tsx", "typescript", "vim", "vue",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "ruby", "rust" },
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

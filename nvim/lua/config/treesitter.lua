local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "bash", "c", "comment", "cpp", "css", "dart", "elixir", "go", "help",
    "html", "java", "javascript", "lua", "python", "ruby", "rust", "scala",
    "scss", "toml", "typescript", "vim", "vue"
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

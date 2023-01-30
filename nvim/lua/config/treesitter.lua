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

local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "bash", "comment", "cpp", "css", "dart", "elixir", "go", "html", "java",
    "javascript", "lua", "python", "ruby", "rust", "scala", "scss", "toml",
    "typescript", "vue"
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

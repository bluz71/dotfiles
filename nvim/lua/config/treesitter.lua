local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "astro", "bash", "c", "clojure", "cpp", "css", "dart", "elixir", "elm",
    "embedded_template", "go", "haskell", "help", "html", "java", "javascript",
    "julia", "lua", "markdown", "markdown_inline", "php", "python", "r",
    "regex", "ruby", "rust", "scala", "scss", "svelte", "toml", "tsx",
    "typescript", "vim", "vue",
  },
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        print("(Tree-sitter) DISABLED, file too large")
        return true
      end
    end,
  },
  indent = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if lang == "ruby" or lang == "rust" or (ok and stats and stats.size > max_filesize) then
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

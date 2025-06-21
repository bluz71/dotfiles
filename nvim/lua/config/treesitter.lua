local treesitter = require("nvim-treesitter.configs")
local buffer = require("util.buffer")

treesitter.setup({
  -- No need to ensure_installed the following parsers.
  --
  -- Neovim 0.9 ships: c, lua, vim & vimdoc parsers
  -- Neovim 0.10 ships: bash, c, lua, markdown, markdown_inline, python, vim &
  --                    vimdoc parsers
  ensure_installed = {
    "astro", "clojure", "cpp", "css", "dart", "elixir", "elm", "embedded_template", "fish", "go",
    "haskell", "html", "java", "javascript", "json", "julia", "odin", "php", "r", "regex", "ruby",
    "rust", "scala", "scss", "svelte", "toml", "tsx", "typescript", "vue", "zig"
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

  -- For nvim-treesitter-endwise plugin.
  endwise = {
    enable = true,
  },
})

-- Setup Tree-sitter parser for Crystal.
--
-- Reference: https://is.gd/fxgR6H
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.crystal = {
  install_info = {
    url = "~/projects/public/tree-sitter-crystal",
    files = {"src/parser.c", "src/scanner.c"},
    branch = "main",
  },
  filetype = "cr",
}

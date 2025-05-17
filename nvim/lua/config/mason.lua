-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local mason = require("mason")

mason.setup({
  -- Install these tools through the Mason interface:
  --   css-lsp
  --   eslint-lsp
  --   html-lsp
  --   htmlhint
  --   jsonlint
  --   markdownlint
  --   prettier
  --   rust-analyzer
  --   selene
  --   stylua
  --   tailwindcss-language-server
  --   typescript-language-server
  ui = {
    backdrop = 100,
    border = "single",
    height = 0.8,
    width = 0.8,
  },
})

vim.keymap.set("n", "'m", ":Mason<CR>")

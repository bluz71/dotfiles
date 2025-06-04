local cmd = vim.cmd
local lsp = vim.lsp
local map = vim.keymap.set
local opt_local = vim.opt_local

-- Do not load up LSP when in diff mode.
if vim.opt.diff:get() or vim.env.NVIM_GIT_DIFF == "1" then
  return
end

local nvim_lsp = require("lspconfig")
local nvim_lsp_windows = require("lspconfig.ui.windows")
local buffer = require("util.buffer")
local lsp_capabilities = require("util.lsp-capabilities")

------------------------------
-- The On Attach Functions  --
------------------------------

-- Default on attach function.
local lsp_on_attach = function()
  -- Disable LSP for files larger than 100KB.
  if buffer.is_large(0) then
    print("(LSP) DISABLED, file too large")
    cmd([[LspStop]])
    return
  end

  -- Default LSP mappings provided by Neovim itself:
  --   K        - Hover
  --   grr      - references
  --   grn      - rename
  --   gra      - code action
  --
  -- Custom mappings:
  map("n", "gd", lsp.buf.definition, { buffer = true })
  -- Note, in my Alacritty terminal config I have 'Control-c' re-mapped to 'Control-k', hence this
  -- mapping actually is 'Control-k'.
  map("i", "<C-c>", lsp.buf.signature_help, { buffer = true })

  -- Note, LSP formatting will be handled by the conform.nvim plugin.

  -- Disable Neovim LSP-set 'omnifunc' and 'formatexpr' options; these options
  -- cause problems with my custom-completion mapping along with the 'gq'
  -- command.
  opt_local.omnifunc = ""
  opt_local.formatexpr = ""
end

-- Custom on attach function which disables LSP formatting where Conform running command line
-- formatter will instead be used.
local lsp_on_attach_no_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  lsp_on_attach()
end

-- Custom on attach function which disable LSP semantic highlighting.
-- local lsp_on_attach_no_semantic_highlights = function(client)
--   client.server_capabilities.semanticTokensProvider = nil
--
--   lsp_on_attach()
-- end

-- Tailwind LSP on attach which disables formatting and trigger characters.
local tailwind_lsp_on_attach = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  -- Tailwind LSP trigger characters are annoying, disable them.
  -- Note, to list current trigger characters run this command:
  --   :lua print(vim.inspect(vim.lsp.buf_get_clients()[1].server_capabilities.completionProvider.triggerCharacters))
  client.server_capabilities.completionProvider.triggerCharacters = {}

  lsp_on_attach()
end

--------------------------
-- The Language Servers --
--------------------------

-- The nvim-cmp completion plugin supports most LSP capabilities; we should notify the language
-- servers about that.
local capabilities = lsp_capabilities.default_capabilities()

nvim_lsp.cssls.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})

nvim_lsp.eslint.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript" },
  flags = { debounce_text_changes = 300 },
})

-- nvim_lsp.gopls.setup({
--   on_attach = lsp_on_attach,
--   capabilities = capabilities,
--   flags = { debounce_text_changes = 300 },
--   settings = { gopls = { semanticTokens = true } },
-- })

nvim_lsp.html.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { "eruby", "html" },
  flags = { debounce_text_changes = 300 },
})

-- gem install ruby-lsp ruby-lsp-rails
nvim_lsp.ruby_lsp.setup({
  on_attach = lsp_on_attach_no_formatting, -- Use standardrb for formatting
  capabilities = capabilities,
  filetypes = { "ruby" },
  flags = { debounce_text_changes = 300 },
})

nvim_lsp.rust_analyzer.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--", "-Aclippy::needless_return" },
      },
    },
  },
})

-- gem install standard standard-rails
nvim_lsp.standardrb.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  filetypes = { "ruby" },
})

nvim_lsp.ts_ls.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
})

nvim_lsp.tailwindcss.setup({
  on_attach = tailwind_lsp_on_attach,
  filetypes = { "astro", "eruby", "html" },
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("vite.config.js"),
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "(?:class:[\\s\\n]*|class=)['\"]([^'\"]+)['\"]",
        },
      },
    },
  },
})

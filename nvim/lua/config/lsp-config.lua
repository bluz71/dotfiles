local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local bo = vim.bo
local buf_get_name = vim.api.nvim_buf_get_name
local cmd = vim.cmd
local get_client_by_id = vim.lsp.get_client_by_id
local lsp = vim.lsp
local lsp_config = vim.lsp.config
local lsp_enable = vim.lsp.enable
local map = vim.keymap.set

-- Do not load up LSP when in diff mode.
if vim.opt.diff:get() or vim.env.NVIM_GIT_DIFF == "1" then
  return
end

local nvim_lsp = require("lspconfig")
local buffer = require("util.buffer")

-- NOTE, use :checkhealth vim.lsp to run LSP healthchecks.

---------------------------
-- Attach Functionality  --
---------------------------

autocmd("LspAttach", {
  callback = function(args)
    local client = get_client_by_id(args.data.client_id)

    -- Disable LSP for files larger than 100KB.
    if buffer.is_large(0) then
      print("(LSP) DISABLED, file too large")
      cmd([[lsp stop]])
      return
    end

    -- Default LSP mappings provided by Neovim itself:
    --   K        - hover
    --   grr      - references
    --   grn      - rename
    --   gra      - code action
    --
    -- Custom mappings:
    map("n", "gd", lsp.buf.definition, { buffer = true })
    -- Note, in my Alacritty terminal config I have 'Control-c' re-mapped to 'Control-k', hence this
    -- mapping actually is 'Control-k'.
    map("i", "<C-c>", lsp.buf.signature_help, { buffer = true })

    -- Disable LSP formatting for certain Language Servers where Conform, running a command line
    -- formatter, will instead be used.
    if
      client.name == "cssls"
      or client.name == "eslint"
      or client.name == "html"
      or client.name == "ruby_lsp"
      or client.name == "ts_ls"
      or client.name == "tailwindcss"
    then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    -- Enable virtual text document color for supported language servers.
    if client:supports_method("textDocument/documentColor") then
      lsp.document_color.enable(true, { bufnr = 0 }, { style = "▮ " })
    end

    -- Disable LSP semantic token highlights for Ruby LSP.
    if client.name == "ruby_lsp" then
      client.server_capabilities.semanticTokensProvider = nil
    end

    -- Tailwind LSP trigger characters are annoying, disable them.
    --
    -- Note, to list current trigger characters run this command:
    --   :lua print(vim.inspect(vim.lsp.buf_get_clients()[1].server_capabilities.completionProvider.triggerCharacters))
    if client.name == "tailwindcss" then
      client.server_capabilities.completionProvider.triggerCharacters = {}
    end

    -- Disable Neovim LSP auto-enabled 'formatexpr' option, it causes problems with the 'gq' format
    -- command.
    bo.formatexpr = ""
  end,
  group = augroup("CustomLspEvent", {}),
})

------------------------------------
-- Configure the Language Servers --
------------------------------------

-- Notify language servers about the LSP capabilities that Neovim supports.
local capabilities = lsp.protocol.make_client_capabilities()
-- Disable client-side watch-files for now, it is slow (see Neovim #23291).
-- Remove this workaround when #23291 is resolved.
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

lsp_config("*", {
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
})

lsp_config("cssls", {
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})

lsp_config("html", {
  filetypes = { "eruby", "html" },
})

lsp_config("ruby_lsp", {
  filetypes = { "ruby" },
})

lsp_config("tailwindcss", {
  filetypes = { "eruby", "html" },
  root_dir = function(bufnr, on_dir)
    on_dir(nvim_lsp.util.root_pattern("vite.config.js")(buf_get_name(bufnr)))
  end,
})

---------------------------------
-- Enable The Language Servers --
---------------------------------

lsp_enable({
  "cssls",
  "eslint",
  "herb_ls",
  "html",
  "ruby_lsp",
  "rust_analyzer",
  "standardrb",
  "ts_ls",
  "tailwindcss",
})

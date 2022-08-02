local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

local M = {}

-- 'dartfmt' is deprecated; 'dart format' will be standard going forward.
M.formattings_dartfmt = h.make_builtin({
  method = FORMATTING,
  filetypes = { "dart" },
  generator_opts = {
    command = "dartfmt",
    to_stdin = true,
  },
  factory = h.formatter_factory,
})

return M

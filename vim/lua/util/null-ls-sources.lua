local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS
local FORMATTING = methods.internal.FORMATTING

local M = {}

M.dartfmt = h.make_builtin({
  method = FORMATTING,
  filetypes = {'dart'},
  generator_opts = {
    command = 'dartfmt',
    to_stdin = true,
  },
  factory = h.formatter_factory,
})

M.jsonlint = h.make_builtin({
  method = DIAGNOSTICS,
  filetypes = {'json'},
  generator_opts = {
    command = 'jsonlint',
    args = {'--compact'},
    to_stdin = true,
    from_stderr = true,
    format = 'line',
    check_exit_code = function(c)
      return c <= 1
    end,
    on_output = h.diagnostics.from_pattern(
      'line (%d+), col (%d+), (.*)',
      {'row', 'col', 'message'},
      {}
    )
  },
  factory = h.generator_factory,
})

M.mdl = h.make_builtin({
  method = DIAGNOSTICS,
  filetypes = {'markdown'},
  generator_opts = {
    command = 'mdl',
    args = {'--json'},
    to_stdin = true,
    format = 'json',
    check_exit_code = function(c)
      return c <= 1
    end,
    on_output = h.diagnostics.from_json({
      attributes = {
        row = 'line',
        code = 'rule',
        message = 'description'
      },
      diagnostic = {
        severity = h.diagnostics.severities.warning
      }
    })
  },
  factory = h.generator_factory,
})

M.prettier_standard = h.make_builtin({
  method = FORMATTING,
  filetypes = {'javascript'},
  generator_opts = {
    command = 'prettier-standard',
    args = {'--stdin'},
    to_stdin = true,
  },
  factory = h.formatter_factory,
})

M.standardjs = h.make_builtin({
  method = DIAGNOSTICS,
  filetypes = {'javascript'},
  generator_opts = {
    command = 'standard',
    args = {'--stdin'},
    to_stdin = true,
    ignore_stderr = true,
    format = 'line',
    check_exit_code = function(c)
      return c <= 1
    end,
    on_output = h.diagnostics.from_pattern(
      ':(%d+):(%d+): (.*)',
      {'row', 'col', 'message'},
      {}
    )
  },
  factory = h.generator_factory,
})

return M

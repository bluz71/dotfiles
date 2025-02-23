local cheatsheet = require("nvcheatsheet")

cheatsheet.setup({
  -- Default header
  header = {
    "                                      ",
    "                                      ",
    "█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
    "█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
    "                                      ",
    "                                      ",
  },
  keymaps = {
    ["Windows Management Mapping"] = {
      { "Split horizontally", ",s" },
      { "Split vertically", ",v" },
      { "Full width split", ",-" },
      { "Full height vsplit", ",|" },
      { "Close", ",q" },
      { "Create new tab", ",t" },
      { "Close current tab", ",T" },
      { "Close quickfix/loction/preview", ",c" },
      { "Switch to numbered tab", ",‹num›" },
      { "Equalize splits", ",=" },
      { "Rotate splits", ",r" },
    },
    ["Navigation Mappings"] = {
      { "Move to next adjacent split", "‹Tab›" },
      { "Move to next split above", "‹Shift-Up›" },
      { "Move to next split below", "‹Shift-Down›" },
      { "Move to next split left", "‹Shift-Left›" },
      { "Move to next split right", "‹Shift-Right›" },
      { "Move down ten lines", "‹Ctrl-j›" },
      { "Move up ten lines", "‹Ctrl-k›" },
      { "Navigate buffers via ‹wildmenu›", ",‹Tab›" },
      { "Alternate last file", "‹Backspace›" },
    },
    ["Helper Mappings"] = {
      { "Redo change", "U" },
      { "Start & stop macro", "qq" },
      { "Replay macro", "Q" },
      { "Virtual insert", "‹Ctrl-q›" },
      { "Insert from clipboard", "‹Ctrl-v›" },
      { "Open a new line above", "‹Ctrl-u›" },
      { "Fix syntax & redraw", "‹Ctrl-l›" },
      { "Copy paragraph", "cp" },
      { "Format paragraph", "qp" },
      { "Format line", "qj" },
      { "Fold", ",z" },
      { "Expand all folds", ",Z" },
      { "Crosshair", ",X" },
      { "Maximise split", ",m" },
      { "Maximize vertical height", ",+" },
      { "Introduction message", ",i" },
      { "Move visual block up", "K" },
      { "Move visual block down", "J" },
    },
    ["Paired Mappings"] = {
      { "Previous change", "[c" },
      { "Next change", "]c" },
      { "Previous jump position", "[j" },
      { "Next jump position", "]j" },
      { "Previous spelling error", "[s" },
      { "Next spelling error", "]s" },
      { "Scroll left", "[z" },
      { "Scroll right", "]z" },
    },
    ["Scroll Mappings"] = {
      { "Scroll screen up", "‹Ctrl-Up›" },
      { "Scroll screen down", "‹Ctrl-Down›" },
    },
    ["Completion Mappings"] = {
      { "Omni", "‹Ctrl-Spc›" },
      { "Keyword sequence from buffer", "‹Ctrl-b›‹Ctrl-n›" },
      { "Dictionary", "‹Ctrl-d›" },
      { "File path", "‹Ctrl-f›" },
      { "Line", "‹Ctrl-l›" },
      { "Snippets", "‹Ctrl-s›" },
    },
    ["Function Key Mappings"] = {
      { "Show highlight group", "F1 / '1" },
      { "Save file", "F2 / '2" },
      { "Replace tabs & remove trailing spaces", "F3 / '3" },
      { "Space to underscore", "F4 / '4" },
      { "Spell checking", "F5 / '5" },
      { "Diagnostics", "F6 / '6" },
      { "Toggle lazydraw & autosave", "F7 / '7" },
      { "Wrapping", "F8 / '8" },
      { "Search highlighting", "F9 / '9" },
      { "Show special chars", "F10 / '0" },
    },
    ["Command Mode Mappings"] = {
      { "Go to start of line", "‹Ctrl-a›" },
      { "Go to end of line", "‹Ctrl-e›" },
      { "Move back word", "‹Alt-b›" },
      { "Move forward word", "‹Alt-f›" },
      { "Delete word backward", "‹Alt-BS›" },
      { "Delete word forward", "‹Alt-d›" },
    },
    ["Grep Mappings"] = {
      { "Search prompt", ",/" },
      { "Search current word or selection", "gs" },
    },
    ["Find & Replace Mappings"] = {
      { "Stationary star search", "g*" },
      { "Star search change", "\\c" },
      { "Accept prev change", "‹Enter›" },
      { "Reject prev change", "!" },
      { "File substitute", "\\s" },
      { "Project substitute", "\\S" },
    },
    ["Sort Operations"] = {
      { "Alphabetically", ":sort" },
      { "Reverse", ":sort!" },
      { "Unique", ":sort u" },
      { "Ignore case", ":sort i" },
      { "Numerical", ":sort n" },
    },
    ["Comment Mappings"] = {
      { "Toggle comments of visual selection", "gc" },
      { "Toggle line comment", "gcc" },
      { "Toggle comments", "gc‹motion›" },
    },
    ["Diagnostic Mappings"] = {
      { "Previous Diagnostic", "[d" },
      { "Next Diagnostic", "]d" },
      { "Line Diagnostics", "'d" },
      { "Location List", "'D" },
    },
    ["LSP Mappings"] = {
      { "Show hover", "K" },
      { "Go to definition", "gd" },
      { "Find references", "gr" },
      { "Rename symbol", "gR" },
      { "Code actions", "ga" },
      { "Signature help", "‹Ctrl-k›" },
    },
    ["Misc Operations"] = {
      { "One time normal command", "‹Ctrl-o›‹command›" },
      { "Expression register", "‹Ctrl-r›=‹math expression›" },
      { "Count search matches", ":%~n" },
      { "Delete pattern lines", ":g/‹@›/d" },
      { "Delete !pattern lines", ":v/‹@›/d" },
      { "Open link under cursor in browser", "gx" },
      { "Read in shell output", ":r !‹shell command›" },
      { "Move line to top", "zt" },
      { "Move line to middle", "zz" },
      { "Move line to bottom", "zb" },
      { "Move cursor to top", "H" },
      { "Move cursor to middle", "M" },
      { "Move cursor to bottom", "L" },
      { "Spelling correction", "z=" },
      { "Substitute in block", ":s/\\%V‹old›/‹new›" },
      { "Print character value", "ga" },
    },

    ["Arrow Plugin Mappings"] = {
      { "Toggle Arrow window", "‹Ctrl-Left›" },
    },
    ["Conform Plugin Mappings"] = {
      { "Run formatter", "'f" },
    },
    ["gitsigns Plugin Mappings"] = {
      { "Previous hunk", "[g" },
      { "Next hunk", "]g" },
      { "Stage hunk", "'+" },
      { "Revert hunk staging", "'-" },
      { "Preview hunk", "'g" },
      { "Refresh signs", "'r" },
    },
    ["Hop Plugin Mappings"] = {
      { "Hop Word", "''" },
      { "Hop Line", "'‹Return›" },
    },
    ["indent-object Plugin Mappings"] = {
      { "Inside indent", "ii" },
      { "Around indent", "ai" },
      { "Around indent & adjacent", "aI" },
    },
    ["Lazy Plugin Mappings"] = {
      { "Show Lazy status window", "'l" },
      { "Show Lazy Profile tab", "'s" },
    },
    ["Mason Plugin Mappings"] = {
      { "Show Mason status window", "'m" },
    },
    ["Neo-tree Plugin Mappings"] = {
      { "Toggle drawer", ",d" },
      { "Find & reveal file", ",f" },
      { "Navigate up file drawer", "‹Backspace›"},
      { "Help", "?" },
    },
    ["nvim-snippy Plugin Mappings"] = {
      { "Expand snippet", "‹Ctrl-j›" },
      { "Jump forward", "‹Ctrl-j›" },
      { "Jump backward", "‹Ctrl-k›" },
    },
    ["Possession Plugin Mappings"] = {
      { "Create or save session", "'p" },
      { "Delete session", "'P" },
    },
    ["Projectionist Plugin Mappings"] = {
      { "Alternate file", ",a" },
      { "Rails controller files", ",ec" },
      { "Rails frontend files", ",ef" },
      { "Rails models files", ",em" },
      { "Rails component files", ",eo" },
      { "Rails view files", ",ev" },
      { "React component files", ",eo" },
      { "React test files", ",et" },
    },
    ["Surround Plugin Mappings"] = {
      { "Change surround", "cs‹old›‹new›" },
      { "Delete surround", "ds‹sur›" },
      { "You surround", "ys‹motion›‹sur›" },
      { "You surround tag", "ys‹motion›t‹sur›" },
      { "You surround function", "ys‹motion›f‹sur›" },
      { "You surround line ends", "yss‹sur›" },
      { "Visual you surround", "S" },
    },
    ["Snacks Plugin Mappings"] = {
      { "Open Lazygit", "‹Ctrl-g›" },
      { "Files", "‹Spc›‹Spc›" },
      { "Smart Files", "‹Spc›s" },
      { "Close", "‹Esc›" },
      { "Scroll forward preview", "‹PageDown›" },
      { "Scroll back preview", "‹PageUp›" },
      { "Scroll forward results", "‹Ctrl-f›" },
      { "Scroll back preview", "‹Ctrl-b›" },
      { "Send to quickfix", "‹Alt-q›" },
      { "Delete buffer", "‹Alt-d›" },
      { "Sibling files", "‹Spc›." },
      { "Buffers", "‹Spc›," },
      { "Interactive Grep", "‹Spc›/" },
      { "Grep current word", "‹Spc›*" },
      { "Current line Git blame", "‹Spc›b" },
      { "Buffer Git commits", "‹Spc›c" },
      { "Git status", "‹Spc›g" },
      { "Neovim help", "‹Spc›h" },
      { "Highlights", "‹Spc›i" },
      { "Current word LSP references", "‹Spc›r" },
      { "Themes", "‹Spc›t" },
      { "Rails controller files", "‹Spc›ec" },
      { "Rails frontend files", "‹Spc›ef" },
      { "Rails models files", "‹Spc›em" },
      { "Rails component files", "‹Spc›eo" },
      { "Rails test files", "‹Spc›et" },
      { "Rails view files", "‹Spc›ev" },
      { "React component files", "‹Spc›eo" },
      { "React test files", "‹Spc›et" },
    },
    ["Undotree Plugin Mappings"] = {
      { "Toggle Undotree", "'u" },
      { "Exit Undotree", "‹Esc›" },
      { "Previous undo state", "<" },
      { "Next undo state", "> " },
    },
    ["Unimpaired Plugin Mappings"] = {
      { "Previous file", "[a" },
      { "Next file", "]a" },
      { "Paste above", "[p" },
      { "Past below", "]p" },
      { "Previous in quickfix", "[q" },
      { "Next in quickfix", "]q" },
      { "Previous in loclist", "[l" },
      { "Next in loclist", "]l" },
      { "Insert a line above", "[‹Spc›" },
      { "Insert a line below", "]‹Spc›" },
    },
    ["vim-test Plugin Mappings"] = {
      { "Run test nearest cursor", "'tt" },
      { "Run file tests", "'tf" },
      { "Run test suite", "'ts" },
      { "Run last test", "'tl" },
    },
  },
})

vim.keymap.set("n", "<F12>", cheatsheet.toggle)

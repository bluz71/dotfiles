runtime custom/options.vim  " Options
runtime custom/terminal.vim " Terminal Vim Tweaks
runtime custom/mappings.vim " Mappings
runtime custom/plug.vim     " Plugin Manager
runtime custom/autocmds.vim " Auto-Commands

" Colorscheme, load from a dotfile if it exists.
if filereadable(expand('~/.colorscheme'))
    exec 'colorscheme ' . readfile(expand('~/.colorscheme'))[0]
else
    colorscheme moonfly
endif

runtime custom/options.vim
runtime custom/terminal.vim
runtime custom/mappings.vim
runtime custom/plug.vim " Plugin Manager
runtime custom/autocmds.vim

" Colorscheme, load from a dotfile if it exists.
if filereadable(expand('~/.colorscheme'))
    exec 'colorscheme ' . readfile(expand('~/.colorscheme'))[0]
else
    colorscheme moonfly
endif

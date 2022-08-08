"===========================================================
" OPTIONS
"===========================================================
lua require('custom.options')


"===========================================================
" FUNCTIONS
"
" ~/dotfiles/nvim/autoload - custom functions
"===========================================================


"===========================================================
" MAPPINGS
"===========================================================
lua require('custom.mappings')
runtime custom/mappings.vim


"===========================================================
" PLUGINS
"===========================================================
lua require('plugin.packer')

"===========================================================
" AUTOCMDS
"===========================================================
runtime custom/autocmds.vim
    " ~/dotfiles/vim/ftplugin       - file type options, mappings
    " ~/dotfiles/vim/after/ftplugin - file type overrides


"===========================================================
" COLOR SCHEME
"===========================================================
if filereadable(expand('~/.colorscheme'))
    exec 'colorscheme ' . readfile(expand('~/.colorscheme'))[0]
else
    colorscheme moonfly
endif

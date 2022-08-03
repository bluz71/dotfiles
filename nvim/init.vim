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
runtime custom/mappings.vim


"===========================================================
" PLUGINS
"===========================================================
" Use packer.nvim to manage plugins in Neovim.
lua require('plugin.packer')

" Load up the match it plugin which provides '%' XML/HTML tag matching.
runtime macros/matchit.vim


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

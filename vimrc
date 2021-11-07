"===========================================================
" OPTIONS
"===========================================================
runtime custom/options.vim


"===========================================================
" FUNCTIONS
"
" ~/dotfiles/vim/autoload - custom functions
"===========================================================


"===========================================================
" TERMINAL VIM SETTINGS
"===========================================================
runtime custom/terminal.vim


"===========================================================
" MAPPINGS
"===========================================================
runtime custom/mappings.vim


"===========================================================
" PLUGINS
"===========================================================
if has('nvim')
    " Use packer.nvim to manage plugins in Neovim.
    lua require('plugin.packer')
else
    " Use vim-plug to manage plugins in Vim.
    runtime custom/plug.vim
endif

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

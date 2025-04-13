" Bootstrap vim-plug.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Disable unused builtin plugins.
let g:loaded_gzip = 1
let g:loaded_netrwPlugin = 1
let g:loaded_remote_plugins = 1
let g:loaded_tarPlugin= 1
let g:loaded_zipPlugin= 1
let g:loaded_2html_plugin = 1
let g:loaded_tutor_mode_plugin = 1

" Load up the match it plugin which provides '%' XML/HTML tag matching.
runtime macros/matchit.vim

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

"-----------------------------
" Colorscheme plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    runtime custom/moonfly.vim " Options must be set before colorscheme call
Plug 'bluz71/vim-nightfly-colors'
    runtime custom/nightfly.vim " Options must be set before colorscheme call

"-----------------------------
" Style plugins
"-----------------------------
Plug 'bluz71/vim-mistfly-statusline'
    " ~/dotfiles/vim/after/plugin/mistfly-statusline.vim

"-----------------------------
" Behavior plugins
"-----------------------------
Plug 'tpope/vim-commentary'
Plug 'chaoren/vim-wordmotion'

"-----------------------------
" Filesystem plugins
"-----------------------------
Plug 'lambdalisue/fern.vim'
    " ~/dotfiles/vim/after/plugin/fern.vim

"-----------------------------
" Misc plugins
"-----------------------------
Plug '907th/vim-auto-save'
    " ~/dotfiles/vim/after/plugin/auto-save.vim
Plug 'dstein64/vim-startuptime'
    " ~/dotfiles/vim/after/plugin/startup.vim

" Finalize vim-plug.
call plug#end()

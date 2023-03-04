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
    " ~/dotfiles/vim/plugin/mistfly-statusline.vim

"-----------------------------
" Behavior plugins
"-----------------------------
Plug 'nelstrom/vim-visual-star-search'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'chaoren/vim-wordmotion'
Plug 'rhysd/clever-f.vim'
    " ~/dotfiles/vim/plugin/clever-f.vim

"-----------------------------
" Fuzzy finding plugins
"-----------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    " ~/dotfiles/vim/plugin/fzf.vim

"-----------------------------
" Filesystem plugins
"-----------------------------
Plug 'lambdalisue/fern.vim'
    " ~/dotfiles/vim/plugin/fern.vim
Plug 'lambdalisue/fern-git-status.vim'
    " ~/dotfiles/vim/plugin/fern-git-status.vim

"-----------------------------
" Misc plugins
"-----------------------------
Plug 'mbbill/undotree'
    " ~/dotfiles/vim/plugin/undotree.vim
    " ~/dotfiles/vim/after/ftplugin/undotree.vim
Plug '907th/vim-auto-save'
    " ~/dotfiles/vim/plugin/auto-save.vim
Plug 'lifepillar/vim-cheat40'
    " ~/dotfiles/vim/plugin/cheat40.vim
Plug 'dstein64/vim-startuptime'
    " ~/dotfiles/vim/plugin/startup.vim

" Finalize vim-plug.
call plug#end()

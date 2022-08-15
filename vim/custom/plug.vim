" Bootstrap vim-plug.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

"-----------------------------
" Colorscheme plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    runtime custom/moonfly.vim " Options must be set before colorscheme call
Plug 'bluz71/vim-nightfly-guicolors'
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
Plug 'tommcdo/vim-lion'
    " ~/dotfiles/vim/plugin/lion.vim
Plug 'rhysd/clever-f.vim'
    " ~/dotfiles/vim/plugin/clever-f.vim
Plug 'ackyshake/VimCompletesMe'

"-----------------------------
" Fuzzy finding plugins
"-----------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    " ~/dotfiles/vim/plugin/fzf.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/fzf.vim - options

"-----------------------------
" Filesystem plugins
"-----------------------------
Plug 'lambdalisue/fern.vim'
    " ~/dotfiles/vim/plugin/fern.vim
    " ~/dotfiles/vim/after/ftplugin/fern.vim
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
Plug 'christoomey/vim-tmux-navigator'
    " ~/dotfiles/vim/plugin/tmux-navigator.vim
Plug 'lifepillar/vim-cheat40'
    " ~/dotfiles/vim/plugin/cheat40.vim
Plug 'dstein64/vim-startuptime'

" Finalize vim-plug.
call plug#end()

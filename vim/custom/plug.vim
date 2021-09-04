" Bootstrap vim-plug.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

"-----------------------------
" Color scheme plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    runtime custom/moonfly.vim " Options must be set before colorscheme call
Plug 'bluz71/vim-nightfly-guicolors'
    runtime custom/nightfly.vim " Options must be set before colorscheme call

"-----------------------------
" Style plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-statusline'
    " ~/dotfiles/vim/plugin/moonfly-statusline.vim - options
Plug 'gcmt/taboo.vim'
    " ~/dotfiles/vim/plugin/taboo.vim - options

"-----------------------------
" Behavior plugins
"-----------------------------
Plug 'nelstrom/vim-visual-star-search'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'chaoren/vim-wordmotion'
    " ~/dotfiles/vim/after/plugin/wordmotion.vim - overrides
Plug 'tommcdo/vim-lion'
    " ~/dotfiles/vim/plugin/lion.vim - options
Plug 'rhysd/clever-f.vim'
    " ~/dotfiles/vim/plugin/clever-f.vim - options
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ackyshake/VimCompletesMe'
Plug 'mbbill/undotree'
    " ~/dotfiles/vim/plugin/undotree.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/undotree.vim - options
Plug '907th/vim-auto-save'
    " ~/dotfiles/vim/plugin/auto-save.vim - options

"-----------------------------
" Filesystem plugins
"-----------------------------
Plug 'lambdalisue/fern.vim'
    " ~/dotfiles/vim/plugin/fern.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/fern.vim - options
Plug 'lambdalisue/fern-git-status.vim'
    " ~/dotfiles/vim/plugin/fern-git-status.vim - options

"-----------------------------
" Misc plugins
"-----------------------------
Plug 'gregsexton/MatchTag'
Plug 'christoomey/vim-tmux-navigator'
    " ~/dotfiles/vim/plugin/tmux-navigator.vim - options, mappings
Plug 'tpope/vim-obsession'
    " ~/dotfiles/vim/plugin/obsession.vim - mappings
Plug 'lifepillar/vim-cheat40'
    " ~/dotfiles/vim/plugin/cheat40.vim - options, mappings
Plug 'dstein64/vim-startuptime'

" Finalize vim-plug.
call plug#end()

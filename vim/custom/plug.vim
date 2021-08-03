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
Plug 'ackyshake/VimCompletesMe'
Plug 'gregsexton/MatchTag'
Plug 'chaoren/vim-wordmotion'
    " ~/dotfiles/vim/after/plugin/wordmotion.vim - overrides
Plug 'tommcdo/vim-lion'
    " ~/dotfiles/vim/plugin/lion.vim - options
Plug 'rhysd/clever-f.vim'
    " ~/dotfiles/vim/plugin/clever-f.vim - options
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
    " ~/dotfiles/vim/after/plugin/unimpaired.vim - overrides
Plug 'mbbill/undotree'
    " ~/dotfiles/vim/plugin/undotree.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/undotree.vim - options
Plug '907th/vim-auto-save'
    " ~/dotfiles/vim/plugin/auto-save.vim - options

"-----------------------------
" Filesystem plugins
"-----------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    " ~/dotfiles/vim/plugin/fzf.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/fzf.vim - options
Plug 'pbogut/fzf-mru.vim'
    " ~/dotfiles/vim/plugin/fzf-mru.vim - options, mappings
Plug 'lambdalisue/fern.vim'
    " ~/dotfiles/vim/plugin/fern.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/fern.vim - options
Plug 'lambdalisue/fern-git-status.vim'
    " ~/dotfiles/vim/plugin/fern-git-status.vim - options

"-----------------------------
" Development plugins
"-----------------------------
Plug 'dense-analysis/ale'
    " ~/dotfiles/vim/plugin/ale.vim - options, mappings
Plug 'tpope/vim-projectionist'
    " ~/dotfiles/vim/plugin/projectionist.vim - mappings
Plug 'janko-m/vim-test'
    " ~/dotfiles/vim/plugin/test.vim - options, mappings
Plug 'hrsh7th/vim-vsnip'
    " ~/dotfiles/vim/plugin/vsnip.vim - options, mappings
    " ~/dotfiles/vim/vsnip - custom snippets
Plug 'editorconfig/editorconfig-vim'
    " ~/dotfiles/vim/plugin/editorconfig.vim - options
Plug 'dart-lang/dart-vim-plugin'
Plug 'vim-crystal/vim-crystal'

"-----------------------------
" Misc plugins
"-----------------------------
Plug 'christoomey/vim-tmux-navigator'
    " ~/dotfiles/vim/plugin/tmux-navigator.vim - options, mappings
Plug 'tpope/vim-obsession'
    " ~/dotfiles/vim/plugin/obsession.vim - mappings
Plug 'lifepillar/vim-cheat40'
    " ~/dotfiles/vim/plugin/cheat40.vim - options, mappings
Plug 'tweekmonster/startuptime.vim'

" Finalize vim-plug.
call plug#end()

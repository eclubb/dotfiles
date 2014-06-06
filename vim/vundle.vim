" -----------------------------------------------------------------------------
" |                              Vundle                                       |
" -----------------------------------------------------------------------------

filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'


" -----------------------------------------------------------------------------
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------

" Generally Useful:
Bundle 'jgdavey/tslime.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-abolish'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'wgibbs/vim-irblack'

" Programming:
"Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
"Bundle 'valloric/youcompleteme'
"Bundle 'sirver/ultisnips'

" Ruby/Rails Programming:
" #Bundle 'astashov/vim-ruby-debugger'
" #Bundle 'ecomba/vim-ruby-refactoring'
" #Bundle 'janx/vim-rubytest'
" Bundle 'jgdavey/vim-blockle'
Bundle 'jgdavey/vim-turbux'
Bundle 'tpope/vim-bundler'
" Bundle 'tpope/vim-cucumber'
" Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-rake'
" Bundle 'vim-ruby/vim-ruby'

" Filetype/Syntax/Intendation:
Bundle 'pangloss/vim-javascript'
" Bundle 'tpope/vim-git'
" Bundle 'vim-scripts/jQuery'
Bundle 'kchmck/vim-coffee-script'

" -----------------------------------------------------------------------------
" |                            VIM Settings                                   |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   uu = inserts '_'                                                        |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,s = strip trailing whitespace                                          |
" |   ,i = toggle invisibles                                                  |
" |   ,z = toggle spell check                                                 |
" |   ,tp = toggle paste mode                                                 |
" |                                                                           |
" |   ,p = paste below and fix indentation                                    |
" |   ,P = paste above and fix indentation                                    |
" |                                                                           |
" |   Y = yank to end of line                                                 |
" |   Q = format text (gq)                                                    |
" |                                                                           |
" |   Ctrl-l = clear search highlights                                        |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" -----------------------------------------------------------------------------


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side-effect.
set nocompatible


" All of the plugins are installed with Vundle from this file.
source ~/.vim/vundle.vim


" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on


let mapleader=','


" Small custom functions.
source ~/.vim/functions.vim

" All of the Vim configuration.
source ~/.vim/config.vim

" All hotkeys, not dependent on plugins, are bound here.
source ~/.vim/bindings.vim

" Auto commands.
source ~/.vim/autocmds.vim

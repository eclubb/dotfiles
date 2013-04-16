" -----------------------------------------------------------------------------
" |                              Auto Commands                                |
" -----------------------------------------------------------------------------

" Automatically reload .vimrc on save
autocmd BufWritePost vimrc source $MYVIMRC

" Jump to last cursor position when opening a file
autocmd BufReadPost * call SetCursorPosition()

" Jump to first line when writing a commit log entry
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" Recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" Set filetype, then update tab style
"autocmd FileType html :set filetype=xhtml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.h set filetype=c
autocmd BufRead,BufNewFile Gemfile set filetype=ruby
autocmd BufRead,BufNewFile Guardfile set filetype=ruby
autocmd FileType * call Tabstyle_auto()


" Omni Completion *************************************************************
"autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" -----------------------------------------------------------------------------
" |                              Bindings                                     |
" -----------------------------------------------------------------------------

imap jj <Esc>
imap uu _
imap hh =>
imap aa @

" Toggle invisible chars
noremap <leader>i :set list!<CR>

" Toggle paste mode
nmap <silent> <leader>tp :set paste!<CR>

" Toggle spell check
nmap <silent> <leader>z :set spell!<CR>

" Start a search and replace for current word
map <Leader>rw :%s/\<<C-r><C-w>\>/

" Paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=

nnoremap gf <C-W>gf
noremap Q gq     " reformat selected text
nnoremap Y y$    " make Y consistent with C and D

" Make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Insert new line without going into insert mode
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" Save and run current file
map <Leader>r :w \| :call Send_to_Tmux("./" . expand('%') . "\n")<CR>

" Run all specs/features
map <Leader>ras :call Send_to_Tmux("rspec spec\n")<CR>
map <Leader>raf :call Send_to_Tmux("cucumber features\n")<CR>

" Arduino
map <Leader>ac :w \| :call Send_to_Tmux("make build\n")<CR>
map <Leader>ad :w \| :call Send_to_Tmux("make deploy\n")<CR>
map <Leader>au :w \| :call Send_to_Tmux("make upload\n")<CR>
map <Leader>am :w \| :call Send_to_Tmux("make monitor\n")<CR>

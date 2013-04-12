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

" All hotkeys, not dependent on plugins, are bound here.
source ~/.vim/bindings.vim

" Small custom functions.
source ~/.vim/functions.vim


" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Use 4-column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

function! Tabstyle_auto()
  if (&ft == 'c') || (&ft == 'cpp') || (&ft == 'make') || (&ft == 'php') || (&ft == 'sh')
    call Tabstyle_tabs()
  else
    call Tabstyle_spaces()
  endif
endfunction

call Tabstyle_auto()


" Indenting *******************************************************************
set ai    " automatically set the indent of a new line (local to buffer)
set si    " smartindent (local to buffer)


" Scrollbars ******************************************************************
set scrolloff=3
set sidescroll=1
set sidescrolloff=7
set numberwidth=4


" Windows *********************************************************************
"set equalalways    " multiple windows, when created, are equal in size
set splitbelow splitright


" Cursor Highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch      " highlight search
set incsearch     " incremental search, search as you type
set ignorecase    " ignore case when searching
set smartcase     " ignore case when searching lowercase


" Colors **********************************************************************
if (&term !~ '^linux$')
  set t_Co=256    " 256 colors
endif

set background=dark
syntax on       " syntax highlighting

colorscheme ir_black


" Status Line *****************************************************************
set showcmd     " show incomplete cmds at the bottom
set showmode    " show current mode at the bottom

hi StatusLine ctermfg=white
hi StatusLineNC ctermfg=lightblue

set statusline=%f    " tail of the filename

" Display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h    " help file flag
set statusline+=%y    " filetype
set statusline+=%r    " read only flag
set statusline+=%m    " modified flag

" Display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

" Display a warning if we have trailing whitespace
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*

" Display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=       " left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \    " current highlight
set statusline+=%c,      " cursor column
set statusline+=%l/%L    " cursor line/total lines
set statusline+=\ %P     " percent through file
set laststatus=2

" Recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" Return '[trailing_whitespace]' if trailing white space is detected
" Return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[trailing_whitespace]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


" Return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" Recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" Return '[&et]' if &et is set wrong
" Return '[mixed-indenting]' if spaces and tabs are used to indent
" Return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        " Don't do this for C files
        if (&ft == 'c') || (&ft == 'cpp')
            return ''
        endif

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction


" Line Wrapping ***************************************************************
set nowrap       " dont wrap lines
set linebreak    " wrap lines at convenient points


" File Stuff ******************************************************************
filetype plugin indent on

"autocmd FileType html :set filetype=xhtml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.h set filetype=c
autocmd BufRead,BufNewFile Gemfile set filetype=ruby
autocmd BufRead,BufNewFile Guardfile set filetype=ruby
autocmd FileType * call Tabstyle_auto()

" Insert New Line **************************************************************
set formatoptions-=r    " don't continue comments when pushing enter
set formatoptions-=o    " don't continue comments when pushing o/O


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set history=1000                  " store lots of :cmdline history
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set number                        " show line numbers
set vb t_vb=                      " turn off bell
set hidden                        " hide buffers when not displayed
set updatecount=0                 " disable swap files


" Invisible Characters ********************************************************
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
set nolist


" Spell Check *****************************************************************
set spelllang=en_us


" Mouse ***********************************************************************
set mouse=a    " enable the mouse
set ttymouse=xterm2
"behave xterm
"set selectmode=mouse


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


" Code Folding *************************************************************
set foldmethod=indent    " fold based on indent
set foldnestmax=3        " deepest fold is 3 levels
set nofoldenable         " don't fold by default


" Command-Line Tab Completion *************************************************************
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing


" Automatically reload .vimrc on save.
autocmd BufWritePost vimrc source $MYVIMRC


" -----------------------------------------------------------------------------
" |                           Plug-in Configuration                           |
" -----------------------------------------------------------------------------

" supertab *********************************************************************
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabCrMapping = 0


" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

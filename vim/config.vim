" -----------------------------------------------------------------------------
" |              Regular Vim Configuration (No Plugins Needed)                |
" -----------------------------------------------------------------------------

" Colors **********************************************************************
if (&term !~ '^linux$')
  set t_Co=256    " 256 colors
endif

set background=dark
syntax on       " syntax highlighting

colorscheme ir_black


" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces
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


" Line Wrapping ***************************************************************
set nowrap       " don't wrap lines
set linebreak    " wrap lines at convenient points


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


" Code Folding *************************************************************
set foldmethod=indent    " fold based on indent
set foldnestmax=3        " deepest fold is 3 levels
set nofoldenable         " don't fold by default


" Command-Line Tab Completion *************************************************************
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing


" Nerd Commenter *************************************************************
let NERDSpaceDelims=1 " insert a space after/before opening/closing delimeter

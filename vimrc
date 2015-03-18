if has('win32') || has('win64')
  set runtimepath=$HOMEDRIVE/$HOMEPATH/vimfiles,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
  set shell=$COMSPEC
endif

scriptencoding utf-8
set encoding=utf-8

call pathogen#infect()
call pathogen#helptags()

" Colors {{{
syntax on           " enable syntax processing
colorscheme atom     " awesome colorscheme
" }}}

" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set shiftwidth=4        " Number of spaces to use for each step of (auto)indent.
set modelines=1
filetype indent on      " load filetype-specific indent files
"set autoindent         " Copy indent from current line when starting a new line
                        " (typing <CR> in Insert mode or when using the "o" or "O"
                        " command).
set listchars=eol:¬,tab:\|\ ,trail:~,extends:>,precedes:<,nbsp:_ " Show end of line, tab, trailing space"
"▸\ "
set list
" }}}

set pastetoggle=<F2>    " Press F2 when you want to paste some text copied from outside of vim and once done press F2 to toggle out
" using vim-airline so not needed set ruler               " Show the line and column number of the cursor position,
                        " separated by a comma.


" Searching {{{
set ignorecase " ignore case when searching

"set incsearch           " search as characters are entered -> set by vim-sensible
set hlsearch            " When there is a previous search pattern, highlight all
                        " its matches.
set showmatch           " When a bracket is inserted, briefly jump to the matching
                        " one. The jump is only done if the match can be seen on the
                        " screen. The time to show the match can be set with
                        " 'matchtime'.
" }}}

" Folding {{{
set foldmethod=indent " fold based on indent level
"set foldnestmax=10 " max 10 depth
set foldenable " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10 " start with fold level of 1
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line ->  set by vim-sensible
set wildmenu
set showmatch " higlight matching parenthesis
" }}}

let mapleader='\'
nnoremap <leader>a ggvG$                        "equivalent of Ctrl A
nnoremap <leader>nt :NERDTreeToggle             "opens a file tree
nnoremap <leader>nb :NERDTreeFromBookmark       "
nnoremap <leader>nf :NERDTreeFind               "open current file on tree

nnoremap <leader><space> :nohlsearch<CR>            " turn off search highlight
nnoremap <leader>l :set list!<CR>

au FileType javascript call JavaScriptFold()

if has('gui_running')
  " set guifont=Lucida_Console:h10
  set guifont=Consolas:h11
endif


"From https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc
"====[ Show when lines extend past column 80 "]================================>-<=====================
highlight ColorColumn ctermbg=magenta
function! MarkMargin (on)
if exists('b:MarkMargin')
try
call matchdelete(b:MarkMargin)
catch /./
endtry
unlet b:MarkMargin
endif
if a:on
let b:MarkMargin = matchadd('ColorColumn', '\%81v', 100)
endif
endfunction
augroup MarkMargin
autocmd!
autocmd BufEnter * :call MarkMargin(1)
autocmd BufEnter *.vp* :call MarkMargin(0)
augroup END

set title           "Show filename in titlebar of window

"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
set viminfo=h,'500,<10000,s1000,/1000,:1000


"" 1. Editing.

" internal encoding
set encoding=utf-8
" file encoding
" ucs-bom: read the bom if you've got it
" utf-8: the best encoding
" sjis: japanese
" gbk: simplified chinese
" big5: traditional chinese (this autodetect isn't working??)
" latin1: a printable fallback encoding
set fileencodings=ucs-bom,utf-8,sjis,gbk,big5,latin1

" ensure autodetection of proper colors and indentation
filetype plugin indent on
syntax enable
set autoindent

" recognize file types
au BufRead,BufNewFile Snakefile set filetype=python
au BufRead,BufNewFile config.txt set filetype=config

" rainbow csv/tsv
" TODO: change "set number" to "setlocal number"
"       and push it upstream
let g:rcsv_colorpairs = [['NONE', 'NONE'], ['cyan', 'cyan'], ['red', 'red'], ['green', 'green'], ['magenta', 'magenta'], ['yellow', 'yellow'], ['blue', 'blue'], ['darkred', 'darkred'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta']]
" TODO: push this autocmd upstream to rainbow-csv as well
autocmd FileType tsv setlocal noexpandtab

" move cursor where there are no characters
set virtualedit=all

" don't make tabs
set expandtab
set tabstop=4
set shiftwidth=4

" scroll with mouse
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

" make long lines easier
function Wrapper()
    set wrap
    set linebreak
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
endfunction

function NoWrapper()
    set nowrap
    set nolinebreak
    nunmap j
    nunmap k
    vunmap j
    vunmap k
endfunction

command Wrap call Wrapper()
command Nowrap call NoWrapper()

Wrap

" fast escape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" search-as-you-type in "/" searches
set incsearch

" highlight all search matches
" (hide current results with :noh)
set hlsearch

" split down and to the right, rather than left and above
set splitbelow
set splitright

" just stop with the macros
nnoremap Q <nop>

" indent when wrapping
" http://stackoverflow.com/questions/1204149/smart-wrap-in-vim
" and a way to disable it
function Copyer()
    set showbreak=
    set nolinebreak
endfunction

function NoCopyer()
    set showbreak=>>\ \ \ \ \ \ \ \ 
    set linebreak
endfunction

command Copy call Copyer()
command Nocopy call NoCopyer()

Nocopy

" shorthand for prev/next buffer
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>

" case insensitive filename completion
set wildignorecase


"" 2. Display.

" show the command typed so far
set showcmd

" show statusline
set laststatus=2
" show where in the file we are
set ruler

" Inkpot, a downloaded colorscheme
" (Inkpot is a 256-color dark color scheme. Among its virtues are good reds
" and greens for diff mode.)
colorscheme inkpot

" keep lines on screen after cursor
set so=2

" Cursor shape for terminals that support it, e.g. mintty
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" stop beeping. you can visual beep
set visualbell


"" 3. Meta.

" source local vimrc, per http://blog.sanctum.geek.nz/local-vimrc-files/
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

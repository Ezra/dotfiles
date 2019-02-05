"" 1. Editing.

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

au BufRead,BufNewFile Snakefile set filetype=python

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


"" 2. Display.

" show the command typed so far
set showcmd

" show statusline
set laststatus=2
" show where in the file we are
set ruler


"" 3. Meta.

" source local vimrc, per http://blog.sanctum.geek.nz/local-vimrc-files/
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

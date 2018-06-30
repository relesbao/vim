set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'bling/vim-airline'
    Plugin 'kien/ctrlp.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'tpope/vim-fugitive' 
    Plugin 'scrooloose/syntastic'
	Plugin 'valloric/youcompleteme'

call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

set ttimeoutlen=0

syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set background=dark
set t_Co=256
let g:solarized_termcolors = 256
colorscheme solarized
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set number
set mouse=a
filetype indent on
set wildmenu
set showmatch
set wildmode=longest,list:full
set incsearch
set hlsearch

nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $

map <BS> :noh<cr>

let mapleader = "\<Space>"

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Personal shortcuts
nmap <leader>d yypk<CR>

" Identation
vnoremap < <gv
vnoremap > >gv
vmap <TAB> >
vmap <S-TAB> <

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md call <SID>StripTrailingWhitespaces()
augroup END

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" Avoid no compile flags error when editing cpp files
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Autoclose preview window after insert
let g:ycm_autoclose_preview_window_after_insertion = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

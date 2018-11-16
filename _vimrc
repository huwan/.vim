set nu
set ruler
set hlsearch
set nocompatible
set encoding=utf-8
set ignorecase smartcase
let mapleader=","
filetype plugin indent on
syntax on
"""""""""""""""Bundle"""""""""""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'bling/vim-airline'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'vim-scripts/autotags'
NeoBundle 'chazy/cscope_maps'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'majutsushi/tagbar' "FIXME: ^[[>0;136;0c
NeoBundle 'tpope/vim-commentary'
NeoBundle 'terryma/vim-expand-region'
" NeoBundle 'Shougo/unite.vim'
NeoBundle 'junegunn/vim-easy-align'
" NeoBundle 'vim-scripts/sudo.vim'
" NeoBundle 'vivien/vim-addon-linux-coding-style'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Airline
set laststatus=2
set t_Co=256
let g:airline_section_y=''
set noshowmode
set ambiwidth=double
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
" let g:airline#extensions#whitespace#mixed_indent_algo = 1

" set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set cinoptions=(0
" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
" Trailing whitespace and tabs are forbidden, so highlight them.
" highlight ForbiddenWhitespace ctermbg=red guibg=red
" match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
" autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

" Removes trailing spaces
function TrimWhiteSpace()
%s/\s*$//
''
" retab
:endfunction

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" Nerdtree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc', '\.pyo', '\.swp', '\~']

" Tagbar
nnoremap <Leader>tl :TagbarToggle<CR>
let g:tagbar_width = 32 " tagbar's width, default 20
" autocmd VimEnter * nested :call tagbar#autoopen(1)  "automate to open tagbar
" let g:tagbar_left = 1 " on the left side
let g:tagbar_right = 1  " on the right side

" Cscope
" Maps ctrl-c to find functions calling the function in cscope
nnoremap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>

" gitcommit check
autocmd Filetype gitcommit setlocal spell textwidth=72

" Jump to the last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" mkdir -p $HOME/.vim/swapfiles # this dir must exist vi does not create it
set directory=$HOME/.vim/swapfiles//

" To have *.inc files be recognized as Makefile
:let g:filetype_inc = "make"

" vim-commentary
autocmd FileType cfg setlocal commentstring=#\ %s
autocmd FileType c,cpp setlocal commentstring=//\ %s

set ruler
set hlsearch
set incsearch
set ignorecase smartcase
set number
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing

" Enable cursor line position tracking:
set cursorline
highlight clear CursorLine

let mapleader=","
noremap \ ,

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
" NeoBundle 'majutsushi/tagbar' "FIXME: ^[[>0;136;0c
NeoBundle 'tpope/vim-commentary'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'pseewald/vim-anyfold'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'derekwyatt/vim-fswitch'

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
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

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

" Mapping to toggle line numbers
nnoremap <silent> <leader>n :set nu!<CR>
nnoremap <silent> <leader>r :set relativenumber!<CR>
" nnoremap <silent> <leader>r :set relativenumber! <bar> set nu!<CR>

" open a file in readonly mode if it already has a swapfile
autocmd SwapExists * let v:swapchoice = "o"

" Autotags
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaS --extra=+q --extra=+f"

" VIM AnyFold
autocmd Filetype * AnyFoldActivate
set foldlevel=99 " Open all folds

" Paste mode
" https://stackoverflow.com/a/38258720
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Disable continuation of comments to the next line
autocmd FileType * set formatoptions-=cro

" Vim Better Whitespace
" let g:better_whitespace_enabled=1
let g:strip_whitelines_at_eof=1
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
map <F2> :StripWhitespace<CR>
map! <F2> :StripWhitespace<CR>

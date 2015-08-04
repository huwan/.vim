set nu
set ruler
set hlsearch
set nocompatible
set encoding=utf-8
" set foldmethod=indent "indent/marker/manual
let mapleader=","
"""""""""""""""Bundle"""""""""""""""""""""""""""""""
 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 "
 " Note: You don't set neobundle setting in .gvimrc!

 NeoBundle 'bling/vim-airline'
 " NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'vim-scripts/autotags'
 NeoBundle 'chazy/cscope_maps'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'tpope/vim-commentary'
 " NeoBundle 'terryma/vim-expand-region'
 " NeoBundle 'Shougo/unite.vim'
 NeoBundle 'junegunn/vim-easy-align'
 NeoBundle 'vim-scripts/sudo.vim'
 NeoBundle 'vivien/vim-addon-linux-coding-style'

 filetype plugin indent on     " Required!
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
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

 " Removes trailing spaces
 function TrimWhiteSpace()
    %s/\s*$//
    ''
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

 " Maps ctrl-c to find functions calling the function in cscope
 nnoremap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>

 " gitcommit check
 autocmd Filetype gitcommit setlocal spell textwidth=72

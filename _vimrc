set nu
set ruler
set hlsearch
set nocompatible
set encoding=utf-8
set foldmethod=indent "indent/marker/manual

"""""""""""""""Bundle"""""""""""""""""""""""""""""""
 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " Recommended to install
 " NeoBundle 'Shougo/vimproc', {
 "           \ 'build' : {
 "           \       'windows' : 'make -f make_mingw32.mak',
 "           \       'cygwin' : 'make -f make_cygwin.mak',
 "           \       'mac' : 'make -f make_mac.mak',
 "           \       'unix' : 'make -f make_unix.mak',
 "           \   },
 "           \ }

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 "
 " Note: You don't set neobundle setting in .gvimrc!

 NeoBundle 'bling/vim-airline'
 "NeoBundle 'Lokaltog/powerline-fonts'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'vim-scripts/autotags'
 NeoBundle 'chazy/cscope_maps'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'tpope/vim-commentary'
 NeoBundle 'terryma/vim-expand-region'
 "NeoBundle 'Shougo/unite.vim'
 NeoBundle 'junegunn/vim-easy-align'
 "NeoBundle 'vim-scripts/sudo.vim'
 " ...

 filetype plugin indent on     " Required!
 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 NeoBundleCheck

 " Airline
 set laststatus=2
 set t_Co=256
 "let g:airline_powerline_fonts = 1
 "set noshowmode
 "set ambiwidth=double

 " indentation rules for FFmpeg: 4 spaces, no tabs
 set expandtab
 set shiftwidth=4
 set softtabstop=4
 set cindent
 set cinoptions=(0
 " Allow tabs in Makefiles.
 autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
 " Trailing whitespace and tabs are forbidden, so highlight them.
 highlight ForbiddenWhitespace ctermbg=red guibg=red
 match ForbiddenWhitespace /\s\+$\|\t/
 " Do not highlight spaces at the end of line while typing on that line.
 autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

 "To follow FFmpeg formatting conventions
 " Removes trailing spaces and retab
 function TrimWhiteSpace()
    %s/\s*$//
    ''
    retab
 :endfunction

 " set list listchars=trail:.,extends:>
 " autocmd FileWritePre * :call TrimWhiteSpace()
 " autocmd FileAppendPre * :call TrimWhiteSpace()
 " autocmd FilterWritePre * :call TrimWhiteSpace()
 " autocmd BufWritePre * :call TrimWhiteSpace()

 map <F2> :call TrimWhiteSpace()<CR>
 map! <F2> :call TrimWhiteSpace()<CR>

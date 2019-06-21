"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/vimshell.vim')
  if has('nvim')
     call dein#add('Shougo/deoplete.nvim')
     call dein#add('Shougo/deoplete-clangx')
     call dein#add('Shougo/neco-vim')
     call dein#add('Shougo/neco-syntax')
     call dein#add('ujihisa/neco-look')
     call dein#add('lvht/phpcd.vim')
  endif
  call dein#add('scrooloose/nerdtree')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('rbtnn/game_engine.vim')
  call dein#add('rbtnn/puyo.vim')
  call dein#add('rbtnn/mario.vim')
  call dein#add('tomasr/molokai')
  call dein#add('osyo-manga/vim-over')
  call dein#add('fatih/vim-go')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------

"vimoption
set backspace=indent,eol,start
set number
colorscheme molokai

"deoplete settings
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_yarp = 1

"NERDTree option
noremap <silent><C-e> :NERDTreeToggle<CR>

"vim-over
nnoremap <silent> <Leader>m :OverCommandLine<CR>

"起動時に実行
autocmd VimEnter * execute 'syntax on'
autocmd VimEnter * execute 'sp'
autocmd VimEnter * execute 'terminal'
autocmd VimEnter * call feedkeys("\<C-w>", "n")
autocmd VimEnter * call feedkeys("l", "n")
autocmd VimEnter * call feedkeys("\<C-w>", "n")
autocmd VimEnter * call feedkeys("x", "n")
autocmd VimEnter * execute 'NERDTreeToggle'

"cc.vim option
" noremap <silent><C-c> :source ~/.vim/cc.vim<CR>
" golang

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " TOML ファイルのパスを変数に代入
  let s:nvim_dir = '$HOME/.config/nvim'
  let s:toml = s:nvim_dir . '/toml/dein.toml'
  let s:lazy_toml = s:nvim_dir . '/toml/dein_lazy.toml'
  let s:local_toml = s:nvim_dir . '/toml/local/dein.toml'
  let s:local_lazy_toml = s:nvim_dir . '/toml/local/dein_lazy.toml'


  " TOML ファイルを読み込む
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:local_toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:local_lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
"End dein Scripts-------------------------

set backspace=indent,eol,start
set number
set expandtab
set tabstop=2
set shiftwidth=2

noremap <silent><C-e> :CocCommand explorer<CR>
colorscheme molokai
nnoremap <silent> <Leader>m :OverCommandLine<CR>

"起動時に実行(画面レイアウトを設定)
autocmd VimEnter * execute 'syntax on'
autocmd VimEnter * execute 'sp'
autocmd VimEnter * execute 'terminal'
autocmd VimEnter * call feedkeys("\<C-w>", "n")
autocmd VimEnter * call feedkeys("l", "n")
autocmd VimEnter * call feedkeys("\<C-w>", "n")
autocmd VimEnter * call feedkeys("x", "n")
autocmd VimEnter * execute 'CocCommand explorer'

" セッションファイルをホームディレクトリに保存
"au VimLeave * mks! ~/session.vim "au VimEnter * :so ~/session.vim

" スワップファイルをホームディレクトリに保存
set swapfile
set directory=~/.backups

" バックアップファイルをホームディレクトリに保存
set backup
set backupdir=~/.backups

" タブを表示するときの幅
set tabstop=2
" タブを挿入するときの幅
set shiftwidth=2

" 空白文字でTabを入力
set expandtab

" 現在行をハイライト
set cursorline

" 行番号を表示
set number

" タブ、空白、改行を可視化する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" insertモード中にEmacsキーバインドでカーソル移動/Del
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <silent> <C-d> <Del>
inoremap <silent> <C-a> <Esc>0<Insert>
inoremap <silent> <C-e> <Esc>$a

"
" Plugin
"

" NeoBundle
if has('vim_starting')
  if &compatible
    set nocompatible
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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" Color theme
syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

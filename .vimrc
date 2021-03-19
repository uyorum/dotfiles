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

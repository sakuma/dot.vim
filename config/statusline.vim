"""""""""""""""""""""""""
" ステータスライン


set laststatus=2 " ステータスラインを常に表示

"set statusline=%F%r%h%= " ステータスラインの内容
""set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [%04v:%04l\/%L(%p%%)]

set statusline=%<%F\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=[\ %v\ :\ L%l\ \/\ %L(%p%%)\ ]


""""""""""""""""""""""""""""""""""""""""""""""""""
"
" %< - 行が長すぎるときに切り詰める位置
" %f - ファイル名（相対パス）
" %F - ファイル名（絶対パス）
" %t - ファイル名（パス無し)
"
" %m - 修正フラグ （[+]または[-]）
" %r - 読み込み専用フラグ（[RO]）
" %h - ヘルプバッファ
" %w - preview window flag
"
" %{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'} - fileencodingとfileformatを表示
"
" %= - 左寄せと右寄せ項目の区切り（続くアイテムを右寄せにする）
" %l - 現在のカーソルの行番号
" %L - 総行数
" %c - column番号
" %V - カラム番号
" %P - カーソルの場所 %表示


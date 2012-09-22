"""""""""""""""""""""""""""""""""""""""
"
" キーマップ定義ファイル
"
" map:     キーシーケンスを展開したあと、さらに別のマップを適用しようする
" noremap: 一度だけ展開
"
"   コマンド    | ノーマル | 挿入 | コマンドライン | ビジュアル |
"  map/noremap  |    o     |  -   |       -        |     o      |
" nmap/nnoremap |    o     |  -   |       -        |     -      |
" imap/inoremap |    -     |  o   |       -        |     -      |
" cmap/cnoremap |    -     |  -   |       o        |     -      |
" vmap/vnoremap |    -     |  -   |       -        |     o      |
" map!/noremap! |    -     |  o   |       o        |     -      |
"
"
"""""""""""""""""""""""""""""""
" 割り当て調査
"   :verb[ose] map [割り当てキー]
"


let mapleader = ','

"vimrcをリローダブルにする
" reload vimrc
noremap <C-c><C-c> <C-c>
noremap <C-x><C-x>e :edit $HOME/.vim/dot.vimrc<CR>
noremap <C-x><C-x> :source $HOME/.vimrc<CR>

" ノーマルモードで ;と:を入れ替え
noremap ; :
noremap : ;

imap <C-@> <C-[>


" 移動系: Emacs風
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-n> <Down>
imap <C-p> <UP>
imap <C-a> <home>
imap <C-e> <end>


" CTRL-hjklでウィンドウ移動
" nnoremap <C-j> ;<C-w>j
" nnoremap <C-k> ;<C-w>k
" nnoremap <C-l> ;<C-w>l
" nnoremap <C-h> ;<C-w>h

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>


""""""""""""""""""
""  補完
""

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap - "zdi<% <C-R>z -%><ESC>
vnoremap % "zdi<%= <C-R>z %><ESC>

" ctrl+tab, ctrl+shift+tab でタブ切り替え
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT

" コマンドラインでのキーバインドを Emacs スタイルにする
" Ctrl+Aで行頭へ移動
:cnoremap <C-A> <Home>
" Ctrl+Bで一文字戻る
:cnoremap <C-B> <Left>
" Ctrl+Dでカーソルの下の文字を削除
:cnoremap <C-D> <Del>
" Ctrl+Eで行末へ移動
:cnoremap <C-E> <End>
" Ctrl+Fで一文字進む
:cnoremap <C-F> <Right>
" Ctrl+Nでコマンドライン履歴を一つ進む
:cnoremap <C-N> <Down>
" Ctrl+Pでコマンドライン履歴を一つ戻る
:cnoremap <C-P> <Up>
" Alt+Ctrl+Bで前の単語へ移動
:cnoremap <C-M-B> <S-Left>
" Alt+Ctrl+Fで次の単語へ移動
:cnoremap <C-M-F> <S-Right>


"ノーマルモード: Enterで一行挿入
map <S-Enter> O<ESC>
map <Enter> o<ESC>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 参考)
"   http://sites.google.com/site/vimdocja/map-html#key-mapping
"
" <Space>
" <UP>, <DOWN>, <LEFT>, <RIGHT>
" Ctrl : C
" Shift : S
" Tab : Tab
" Meta : M
" Enter : <CR>
"
"



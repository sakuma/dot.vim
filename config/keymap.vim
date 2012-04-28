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

" ;でコマンド入力( ;と:を入れ替)
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

" ctrl+tab, ctrl+shift+tab でタブ切り替え
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT



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



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


let mapleader = ','

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
noremap : ;

imap <C-@> <C-[>

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


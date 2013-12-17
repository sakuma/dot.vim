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

" Space
let mapleader = " "

"vimrcをリローダブルにする
" reload vimrc
noremap <C-c><C-c> <C-c>
noremap <C-x><C-x>e :edit $HOME/.vim/vimrc<CR>
noremap <C-x><C-x> :source $HOME/.vimrc<CR>

" ノーマルモードで ;と:を入れ替え
noremap ; :
noremap : ;

imap <C-@> <C-[>

inoremap , ,<Space>

" 移動系: Emacs風
inoremap <C-b> <Left>
inoremap <C-f> <Right>
" imap <C-n> <Down>
" imap <C-p> <UP>
inoremap <C-a> <Home>
inoremap <C-e> <End>

"カーソルを表示行で移動する。
nnoremap j gj
nnoremap k gk
" nnoremap <Down> gj
" nnoremap <Up>   gk"
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k"

" Ctrl-s で保存
" 保存後ノーマルモードに戻る
imap <script> <C-s> <SID>(gui-save)<Esc>
nmap <script> <C-s> <SID>(gui-save)
imap <script> <SID>(gui-save) <C-o><SID>(gui-save)
nnoremap      <SID>(gui-save) :<C-u>call <SID>gui_save()<CR>
function! s:gui_save()
  let cursor = getpos(".")
  " 行末の空白を除去する
  %s/\s\+$//ge
  " tabを2スペースに変換する
  %s/\t/  /ge
  call setpos(".", cursor)
  unlet cursor

  if bufname('%') ==# ''
    browse confirm saveas
  else
    update
  endif
endfunction

" CTRL-hjklでウィンドウ移動
" nnoremap <C-j> ;<C-w>j
" nnoremap <C-k> ;<C-w>k
" nnoremap <C-l> ;<C-w>l
" nnoremap <C-h> ;<C-w>h

" 選択したテキストの移動 (t9md/vim-textmanip)
if has('gui_macvim')
  xmap <M-d> <Plug>(textmanip-duplicate-down)
  nmap <M-d> <Plug>(textmanip-duplicate-down)
  xmap <M-D> <Plug>(textmanip-duplicate-up)
  nmap <M-D> <Plug>(textmanip-duplicate-up)

  xmap <C-j> <Plug>(textmanip-move-down)
  xmap <C-k> <Plug>(textmanip-move-up)
  xmap <C-h> <Plug>(textmanip-move-left)
  xmap <C-l> <Plug>(textmanip-move-right)
else
  " * vim on terminal
  xmap <Space>d <Plug>(textmanip-duplicate-down)
  nmap <Space>d <Plug>(textmanip-duplicate-down)
  xmap <Space>D <Plug>(textmanip-duplicate-up)
  nmap <Space>D <Plug>(textmanip-duplicate-up)

  xmap <C-j> <Plug>(textmanip-move-down)
  xmap <C-k> <Plug>(textmanip-move-up)
  xmap <C-h> <Plug>(textmanip-move-left)
  xmap <C-l> <Plug>(textmanip-move-right)
endif

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>


""""""""""""""""""
""  補完
""

vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

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
noremap <S-Enter> O<ESC>
noremap <Enter> o<ESC>

" visualモードで選択して「Ctrl-p」で貼り付け
vnoremap <silent> <C-p> "0p<CR>

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

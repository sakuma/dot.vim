"""""""""""""""""""""""""""""""""""""""""
" unite setting
"

" 入力モードで開始する
let g:unite_enable_start_insert=1
"let g:unite_enable_split_vertically = 1 "縦分割で開く
"let g:unite_winwidth = 40 "横幅40で開く

" 最近使用したファイル一覧
" nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <leader>z :<C-u>Unite file_mru<CR>
" cnoremap um :<C-u>Unite file_mru -buffer-name=file_mru<CR>

" レジスタ一覧
nnoremap <leader>re :<C-u>Unite -buffer-name=register register<CR>
" cnoremap ur :<C-u>Unite register -buffer-name=register<CR>

" バッファ一覧
nnoremap <leader>b :<C-u>Unite buffer<CR>
" cnoremap ub :<C-u>Unite buffer -buffer-name=buffer<CR>

" ファイル一覧
nnoremap <leader>f :<C-u>UniteWithBufferDir file file/new -buffer-name=file<CR>
" cnoremap ue :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

"file current_dir
"noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
"noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>
"
""file file_current_dir
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>


" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"" unite-grep {{{
" unite-grepのバックエンドをagに切り替える
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" unite-grepのキーマップ
" grep検索
nnoremap <leader>gr  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <leader>grw :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <leader>grr  :<C-u>UniteResume search-buffer<CR>
" }}}

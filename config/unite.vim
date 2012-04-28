"""""""""""""""""""""""""""""""""""""""""
" unite setting
"

" 入力モードで開始する
let g:unite_enable_start_insert=1
"let g:unite_enable_split_vertically = 1 "縦分割で開く
"let g:unite_winwidth = 40 "横幅40で開く

cnoremap um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
cnoremap ur :<C-u>Unite register -buffer-name=register<CR>
" バッファ一覧
""nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
cnoremap ub :<C-u>Unite buffer -buffer-name=buffer<CR>

" ファイル一覧
""nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
cnoremap ue :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

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


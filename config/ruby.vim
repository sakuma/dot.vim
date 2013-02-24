autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"

"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

" Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" rubycomplete.vim
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"" unite-rails
noremap <Leader>rr :<C-u>Unite rails/root<CR>
noremap <Leader>ra :<C-u>Unite rails/app<CR>
noremap <Leader>rc :<C-u>Unite rails/controller<CR>
noremap <Leader>rm :<C-u>Unite rails/model<CR>
noremap <Leader>rv :<C-u>Unite rails/view<CR>
noremap <Leader>rh :<C-u>Unite rails/helper<CR>""

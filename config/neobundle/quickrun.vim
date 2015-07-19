"" ウィンドウが開く位置
" 横分割時は下へ
" set splitbelow
" 縦分割時は右へ
set splitright

let g:quickrun_config = {
      \    'go': {
      \       'command': 'go',
      \       'cmdopt': 'run',
      \    }
      \ }

" vim-marked mapping
" autocmd FileType mkd nnoremap <Leader>r :MarkedOpen<CR>


let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }

" let g:quickrun_config.markdown = {
"       \ 'type': 'markdown/pandoc',
"       \ 'cmdopt': '-s',
"       \ 'outputter': 'browser'
"       \ }

"" ウィンドウが開く位置
" 横分割時は下へ
set splitbelow
" 縦分割時は右へ
set splitright

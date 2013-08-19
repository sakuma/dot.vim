"*****************************************
"  fugitive
"
"
" Fugitive {{{
nnoremap [git] <Nop>
nmap <Leader>g [git]
nnoremap [git]d :<C-u>Gdiff HEAD<Enter>
nnoremap [git]s :<C-u>Gstatus<Enter>
nnoremap [git]l :<C-u>Glog<Enter>
nnoremap [git]a :<C-u>Gwrite<Enter>
nnoremap [git]c :<C-u>Gcommit<Enter>
nnoremap [git]C :<C-u>Git commit --amend<Enter>
nnoremap [git]b :<C-u>Gblame<Enter>
" }}}


"*****************************************
" GitV

"*********************
" Config
"
" Load Bigger Commit Batches:
let g:Gitv_CommitStep=300

" Be Smart About Whether To Open The Browser In A Horizontal Or Vertical Tab:
let g:Gitv_OpenHorizontal='auto'

" Mercilessly Purge All Fugitive Buffers In The Browser Tab:
let g:Gitv_WipeAllOnClose=1

"*********************
" Keymappings
"
" Open In File Mode:
nnoremap <leader>gV :Gitv --all<CR>

" Open In Browser Mode:
nnoremap <leader>gv :Gitv! --all<CR>
vnoremap <leader>gv :Gitv! --all<CR>


""""""""""""
" vim-gitgutter


"" default on
let g:gitgutter_enabled = 0
"" default off
" let g:gitgutter_highlight_lines = 1

""" turn off with
" :GitGutterDisable

""" turn on with
" :GitGutterEnable

""" toggle with
" :GitGutterToggle.
" And you can turn line highlighting on and off (defaults to off):

""" turn on with
" :GitGutterLineHighlightsEnable

""" turn off with
" :GitGutterLineHighlightsDisable

""" toggle with
" :GitGutterLineHighlightsToggle.
" Furthermore you can jump between hunks:

""" jump to next hunk:
" :GitGutterNextHunk

""" jump to previous hunk:
" :GitGutterPrevHunk.

""""""""""""""
" 'int3/vim-extradite.git'
"
" usage:
"
"   :Extradite
"

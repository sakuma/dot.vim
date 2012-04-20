""""""""""""""""""""""""""""
"" plugins - vundle
""
""
"""""""""""""""""""""""""""""""""""""""
"" vim-scripts リポジトリ(例)
" Bundle 'rails.vim'
"
"" github の任意のリポジトリ
" Bundle 'tpope/vim-rails'
"
"" github 以外のリポジトリ
" Bundle 'git://git.wincent.com/command-t.git'
"""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/vundle.git/
call vundle#rc()

""" Ruby 関連
Bundle 'ruby.vim'
Bundle 'tpope/vim-endwise'

" Bundle 'rails.vim' "autoload でエラーがでるため、下記のbundleを使う
Bundle 'tpope/vim-rails'
source ~/.vim/config/vim-rails-conf.vim

""" git plugin
Bundle 'tpope/vim-fugitive'

""""" 検討
"""
""" svncommand.vim
"""
""" http://www.vim.org/scripts/script.php?script_id=922
"""
"""

" Bundle 'git://git.wincent.com/command-t.git'

" Bundle 'project.vim'
Bundle 'scrooloose/nerdtree'
:nnoremap <F3> :NERDTreeToggle<CR>


Bundle 'The-NERD-Commenter'
Bundle 'Shougo/neocomplcache'
:source ~/.vim/config/neocomplcache.vim

""" reference plugin
Bundle 'thinca/vim-ref'
"""
" Ruby
" document archive - http://doc.okkez.net/archives/
"
" $ cd /tmp
" $ wget http://doc.okkez.net/archives/201107/ruby-refm-1.9.2-dynamic-20110729.tar.gz
" $ tar xvzf ruby-refm-1.9.2-dynamic-20110729.tar.gz
" $ mv ruby-refm-1.9.2-dynamic-20110729/* ~/.vim/docs/rubyrefm
"
""" 標準添付以外のソース
" https://github.com/thinca/vim-ref/wiki/sources

" Bundle 'buftabs'
Bundle 'bufexplorer.zip'

""" ツリー形式でファイルの編集履歴を表示
Bundle 'Gundo'
:nnoremap <F5> :GundoToggle<CR>

Bundle 'tpope/vim-surround'

Bundle 'mattn/calendar-vim'

" open browser
"   more ... :help open-browser
"
Bundle 'tyru/open-browser.vim'
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


Bundle 'Shougo/unite.vim'
" uniteの設定 ======================================
" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_enable_split_vertically = 1 "縦分割で開く
let g:unite_winwidth = 40 "横幅40で開く
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q



Bundle 'Align'
:let g:Align_xstrlen = 3  " for japanese string
:let g:DrChipTopLvlMenu = ''   " remove 'DrChip' menu


filetype plugin indent on

""""""""""""""""""""""""""""
"" plugins - neobundle
""
""
"""""""""""""""""""""""""""""""""""""""
"" vim-scripts リポジトリ(例)
" NeoBundle 'rails.vim'
"
"" github の任意のリポジトリ
" NeoBundle 'tpope/vim-rails'
"
"" github 以外のリポジトリ
" NeoBundle 'git://git.wincent.com/command-t.git'
"""""""""""""""""""""""""""""""""""""""

set nocompatible "Vi互換をオフ
filetype off
filetype plugin indent off

set rtp+=~/.vim/neobundle.git/
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif


""" Ruby 関連
NeoBundle 'ruby.vim'
NeoBundle 'tpope/vim-endwise'

" NeoBundle 'rails.vim' "autoload でエラーがでるため、下記のbundleを使う
NeoBundle 'tpope/vim-rails'
source ~/.vim/config/ruby.vim

""" git plugin
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'int3/vim-extradite.git'

""""" 検討
"""
""" svncommand.vim
"""
""" http://www.vim.org/scripts/script.php?script_id=922
"""
"""

" NeoBundle 'git://git.wincent.com/command-t.git'

" NeoBundle 'project.vim'
NeoBundle 'scrooloose/nerdtree'
:nnoremap <F3> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

NeoBundle 'tomtom/tcomment_vim'

if version >= 702
  NeoBundle 'Shougo/neocomplcache'
endif

:source ~/.vim/config/neocomplcache.vim

""" reference plugin
NeoBundle 'thinca/vim-ref'
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

" NeoBundle 'buftabs'
NeoBundle 'bufexplorer.zip'

""" ツリー形式でファイルの編集履歴を表示
NeoBundle 'Gundo'
:nnoremap <F5> :GundoToggle<CR>

NeoBundle 'tpope/vim-surround'

NeoBundle 'mattn/calendar-vim'

" open browser
"   more ... :help open-browser
"
NeoBundle 'tyru/open-browser.vim'
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


if version >= 702
  NeoBundle 'Shougo/unite.vim'
  :source ~/.vim/config/unite.vim
endif

NeoBundle 'Align'
:let g:Align_xstrlen = 3  " for japanese string
:let g:DrChipTopLvlMenu = ''   " remove 'DrChip' menu

"""" xml
NeoBundle 'xmledit'

"""" recent opened file
NeoBundle 'mru.vim'

NeoBundle 'YankRing.vim'
let g:yankring_max_history = 50
noremap <C-S-p> :YRSearch<CR>
"noremap <C-S-u> :YRShow<CR>

NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'MultipleSearch'
NeoBundle 'csv.vim'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimfiler.git'

filetype plugin indent on


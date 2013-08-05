""""""""""""""""""""""""""""
"" plugins - neobundle
"
" Brief help
"   :NeoBundleList          - list configured bundles
"   :NeoBundleInstall(!)    - install(update) bundles
"   :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"
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

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif


if version >= 702
  NeoBundle 'Shougo/unite.vim'
  source ~/.vim/config/unite.vim
endif

""" Ruby 関連
NeoBundle 'ruby.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'ruby-matchit'

" Railsサポート
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rake'
" NeoBundle 'taichouchou2/vim-rails'
" NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
" NeoBundle 'basyura/unite-rails' " original
NeoBundle 'n-sakuma/unite-rails'  " custom

source ~/.vim/config/ruby.vim

"""
" Git plugins
"
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'int3/vim-extradite.git'

source ~/.vim/config/gitconfig.vim


""""" 検討
"""
""" svncommand.vim
"""
""" http://www.vim.org/scripts/script.php?script_id=922
"""
"""


" NeoBundle 'project.vim'
NeoBundle 'scrooloose/nerdtree'
:nnoremap <F3> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

NeoBundle 'tomtom/tcomment_vim'

if version >= 702
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'honza/vim-snippets'
  :source ~/.vim/config/snippet.vim

  NeoBundle 'Shougo/context_filetype.vim'
endif

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


NeoBundle 'Align'
:let g:Align_xstrlen = 3  " for japanese string
:let g:DrChipTopLvlMenu = ''   " remove 'DrChip' menu

""""""""""""""""""""""""""""""""
"" color

" NeoBundle 'vim-scripts/Colour-Sampler-Pack'
" source ~/.vim/config/color.vim
" colorscheme torte

if has('gui_macvim')
  NeoBundle 'altercation/vim-colors-solarized'
  syntax enable
  set background=dark
  " set background=light
  colorscheme solarized
else
  NeoBundle 'vim-scripts/Colour-Sampler-Pack'
  source ~/.vim/config/color.vim
  colorscheme torte
endif

NeoBundle 'Lokaltog/vim-powerline'

" let g:Powerline_theme = 'skwp'
" let g:Powerline_theme = 'solarized256'
" let g:Powerline_colorscheme = 'skwp'
let g:Powerline_symbols = 'fancy'  " or 'compatible'(default), 'unicode'
" let g:Powerline_stl_path_style = 'filename'  " default 'relative'
let g:Powerline_cache_enabled = 0
let g:Powerline_mode_n = ' N '
" let g:Powerline_mode_i = 'Insert'
" set guifont=Ricty_for_Powerline:h16
set guifontwide=Ricty:h16

""""""""""""""""""""""""""""""""


"""" xml
NeoBundle 'xmledit'

"""" recent opened file
NeoBundle 'mru.vim'

NeoBundle 'YankRing.vim'
let g:yankring_max_history = 50
let g:yankring_replace_n_pkey = '<m-p>'
noremap <C-S-p> :YRSearch<CR>
"noremap <C-S-u> :YRShow<CR>

NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'MultipleSearch'
NeoBundle 'csv.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimfiler.git'

NeoBundle 'thinca/vim-quickrun'

"" grepの拡張
NeoBundle 'fuenor/qfixgrep'
"" 設定: config/ffixhown-config.vim

NeoBundle 'mileszs/ack.vim'

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
NeoBundle 'kchmck/vim-coffee-script'

"" tool 群
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

NeoBundle 'taku-o/vim-toggle'
let g:toggle_pairs = { 'and': 'or', 'or': 'and', 'if': 'unless', 'unless': 'if', 'while': 'until', 'until': 'while', 'elsif': 'else', 'else': 'elsif' }

filetype plugin indent on

" Installation check.
" if neobundle#exists_not_installed_bundles()
"   echomsg 'Not installed bundles : ' .
"         \ string(neobundle#get_not_installed_bundle_names())
"   echomsg 'Please execute ":NeoBundleInstall" command.'
" endif

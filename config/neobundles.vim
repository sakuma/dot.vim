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
  " set runtimepath+=~/.vim/neobundle.vim
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

if version >= 702
  NeoBundle 'Shougo/unite.vim'
  source ~/.vim/config/unite.vim
endif

NeoBundle 'scrooloose/syntastic'

""" Ruby 関連
NeoBundle 'ruby.vim'
NeoBundle 'tpope/vim-endwise'
source $VIMRUNTIME/macros/matchit.vim
NeoBundle 'ruby-matchit'

NeoBundle 'thinca/vim-visualstar'
NeoBundle 'Lokaltog/vim-easymotion'
" easymotion settting {{{
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=":"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}}
NeoBundle 't9md/vim-textmanip'
NeoBundle 'kana/vim-textobj-user'
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif
" ブロック選択
NeoBundle 'nelstrom/vim-textobj-rubyblock'

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
  NeoBundle 'Shougo/neocomplete.vim'
  :source ~/.vim/config/neocomplete.vim

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


NeoBundle 'godlygeek/tabular'

" tabular config {{{
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" inoremap <silent> | <Bar><Esc>:call <SID>align()<CR>a
" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   " if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"   if getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize /|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction
"
" replace by  'Tabular'
" NeoBundle 'Align'
" :let g:Align_xstrlen = 3  " for japanese string
" :let g:DrChipTopLvlMenu = ''   " remove 'DrChip' menu
"
" }}}

""""""""""""""""""""""""""""""""
"" color

" NeoBundle 'vim-scripts/Colour-Sampler-Pack'
" source ~/.vim/config/color.vim
" colorscheme torte

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Colour-Sampler-Pack'

if has('gui_macvim')
  " solarized
  syntax enable
  set background=dark
  " set background=light
  colorscheme solarized
else
  " Colour-Sampler-Pack
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
NeoBundle 'thinca/vim-poslist'

"""" markdown
NeoBundle 'plasticboy/vim-markdown'
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

NeoBundle 'YankRing.vim'
let g:yankring_max_history = 50
let g:yankring_replace_n_pkey = '<m-p>'
noremap <C-S-p> :YRSearch<CR>
"noremap <C-S-u> :YRShow<CR>

NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'MultipleSearch'
NeoBundle 'csv.vim'

NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimfiler.git'

NeoBundle 'thinca/vim-quickrun'
source ~/.vim/config/quickrun.vim

"" grepの拡張
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'fuenor/qfixgrep'
"" 設定: config/ffixhown-config.vim

NeoBundle 'mileszs/ack.vim'

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-scripts/css_color.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'mattn/zencoding-vim'
" TODO: replace zencoding-vim
" NeoBundle 'mattn/emmet-vim'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
NeoBundle 'kchmck/vim-coffee-script'

"" tool 群
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
NeoBundle 'vim-scripts/AnsiEsc.vim'

NeoBundle 'AndrewRadev/switch.vim'
let g:switch_custom_definitions =
      \ [
      \   ["unless", "if"],
      \   ["and", "or"],
      \   ["while", "until"],
      \   ["else", "elsif"],
      \   ["blank?", "present?"],
      \   ["describe", "context", "specific", "example"],
      \   ['before', 'after'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['==', 'be_eql', 'equal'],
      \   ['.to_not', '.to'],
      \   { '([^. ]+).should(_not|)': 'expect(\1).to\2' },
      \   { 'expect(([^. ]+)).to(_not|)': '\1.should\2' },
      \ ]

filetype plugin indent on

" Installation check.
" if neobundle#exists_not_installed_bundles()
"   echomsg 'Not installed bundles : ' .
"         \ string(neobundle#get_not_installed_bundle_names())
"   echomsg 'Please execute ":NeoBundleInstall" command.'
" endif

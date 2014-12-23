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

filetype off

if has('vim_starting')
  if &compatible
     set nocompatible               " Be iMproved
   endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'tpope/vim-pathogen'

if version >= 702
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'alpaca-tc/vim-unite-giti'
  source ~/.vim/config/unite.vim
endif

NeoBundle 'scrooloose/syntastic'
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" --- js config ---
" $ npm install -g jshint
" -----
"  write ~/.jshintrc
" -----
" {
"   "strict"    : true,
"   "indent"    : 4,
"   "camelcase" : true,
"   "unused"    : true,
"   "eqeqeq"    : true,
"   "undef"     : true,
"   "browser"   : true,
"   "jquery"    : true,
"   "devel"     : true
" }
let g:syntastic_mode_map = {
  \ "mode" : "active",
  \ "active_filetypes" : ["javascript", "json"],
  \}

""" Ruby 関連
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-endwise'
:source $VIMRUNTIME/macros/matchit.vim
NeoBundle 'ruby-matchit'
" Rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rake'
" NeoBundle 'taichouchou2/vim-rails'
" NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
" NeoBundle 'basyura/unite-rails' " original
NeoBundle 'sakuma/unite-rails'  " custom
NeoBundle 'tpope/vim-dispatch'
" NeoBundle 'thoughtbot/vim-rspec'
" let g:rspec_command = "Dispatch bundle exec rspec {spec}"
NeoBundleLazy 'thoughtbot/vim-rspec', {
                \ 'depends'  : 'tpope/vim-dispatch',
                \ 'autoload' : { 'filetypes' : ['ruby'] }
                \ }
let s:bundle = neobundle#get('vim-rspec')
function! s:bundle.hooks.on_source(bundle)
   let g:rspec_command = 'Dispatch bundle exec rspec {spec}'
endfunction

:source ~/.vim/config/ruby.vim

"""
" golang
NeoBundle 'fatih/vim-go'
" NeoBundle 'jnwhiteh/vim-golang'   " 公式
let g:go_snippet_engine = "neosnippet"  "default ultisnips
autocmd FileType go autocmd BufWritePre <buffer> GoImports

"""
" Scala
NeoBundle 'derekwyatt/vim-scala'

"""
" Elixir
NeoBundle 'elixir-lang/vim-elixir'

NeoBundle 'thinca/vim-visualstar'
NeoBundle 'Lokaltog/vim-easymotion'
" easymotion settting {{{
" ホームポジションに近いキーを使う
:let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" <Leader> + e + (w, k, ...)
:let g:EasyMotion_leader_key="e"
" 1 ストローク選択を優先する
:let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}}
NeoBundle 't9md/vim-textmanip'
NeoBundle 'kana/vim-textobj-user'

" ブロック選択
NeoBundle 'nelstrom/vim-textobj-rubyblock'


"""
" Git plugins
"
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'cohama/agit.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'int3/vim-extradite.git'
NeoBundle 'mhinz/vim-signify'
" see other conf


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
:let NERDTreeShowHidden = 1

NeoBundle 'majutsushi/tagbar'
nnoremap <F4> :TagbarToggle<CR>
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

NeoBundle 'tomtom/tcomment_vim'

if version >= 702
  NeoBundle 'Shougo/neocomplete.vim'
  :source ~/.vim/config/neocomplete.vim

  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
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
NeoBundle 'mhinz/vim-startify'

" open browser
"   more ... :help open-browser
"
NeoBundle 'tyru/open-browser.vim'
:let g:netrw_nogx = 1 " disable netrw's gx mapping.
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

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Colour-Sampler-Pack'
NeoBundle 'chriskempson/vim-tomorrow-theme'   " for Ruby
NeoBundle 'w0ng/vim-hybrid'
" see other conf

NeoBundle 'itchyny/lightline.vim'
" see conf lightline.vim


""""""""""""""""""""""""""""""""


"""" xml
NeoBundle 'xmledit'

"""" recent opened file
" NeoBundle 'mru.vim'
NeoBundle 'Shougo/neomru.vim'
" :let MRU_File = $HOME . '/.vim/vim_mru_files'

NeoBundle 'thinca/vim-poslist'

"""" markdown
NeoBundle 'plasticboy/vim-markdown'
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

NeoBundle 'zaiste/tmux.vim'

NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'YankRing.vim'
" :let g:yankring_max_history = 50
" :let g:yankring_replace_n_pkey = '<m-p>'
" noremap <C-S-p> :YRSearch<CR>
"noremap <C-S-u> :YRShow<CR>

" Evernote
" NeoBundle 'kakkyz81/evervim'

NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'MultipleSearch'
NeoBundle 'csv.vim'

NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'  " see other conf

"" grepの拡張
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'thinca/vim-qfreplace'
"" 設定: config/ffixhown-config.vim

NeoBundle 'rking/ag.vim'

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-scripts/css_color.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'angularjs,backbone,underscore'
" jQuery: jquery
" underscore.js: underscore
" Lo-Dash: underscore
" Backbone.js: backbone
" prelude.ls: prelude
" AngularJS: angularjs
" AngularUI: angularui
" RequireJS: requirejs
" Sugar.js: sugar
" Jasmine: jasmine

NeoBundle 'kchmck/vim-coffee-script'
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'

"" tool 群
NeoBundle 'nathanaelkane/vim-indent-guides'
:let g:indent_guides_enable_on_vim_startup=1
:let g:indent_guides_guide_size=1
NeoBundle 'vim-scripts/AnsiEsc.vim'

NeoBundle 'osyo-manga/vim-over'
:let g:over_command_line_prompt = "Over Command> "
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

NeoBundle 'kana/vim-smartinput'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'syui/wauto.vim'
let g:auto_write = 1
NeoBundle 'gmarik/sudo-gui.vim'
" NeoBundle 'thinca/vim-localrc'

call neobundle#end()

filetype plugin indent on

" ~/.vim/config/neobundle 配下のファイルを読み込む
for f in split(glob('~/.vim/config/neobundle/*.vim'), '\n')
  exe 'source' f
endfor

" Installation check.
NeoBundleCheck

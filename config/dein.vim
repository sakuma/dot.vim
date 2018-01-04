"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:

" if dein#load_state('~/.vim/dein')
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
" call dein#add('Shougo/vimproc')
" call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('alpaca-tc/vim-unite-giti')
source ~/.vim/config/unite.vim

call dein#add('tomtom/tcomment_vim')
call dein#add('Shougo/neocomplete.vim')
source ~/.vim/config/neocomplete.vim
call dein#add('honza/vim-snippets')
source ~/.vim/config/snippet.vim
call dein#add('Shougo/context_filetype.vim')
call dein#add('thinca/vim-ref')
call dein#add('scrooloose/syntastic')
" call dein#add('mtscout6/syntastic-local-eslint.vim')
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
 " エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0

call dein#add('tpope/vim-surround')
call dein#add('mhinz/vim-startify')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tyru/open-browser.vim')
:let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
call dein#add('tpope/vim-endwise')
:source $VIMRUNTIME/macros/matchit.vim
call dein#add('vim-scripts/Gundo')
:nnoremap <F5> :GundoToggle<CR>
call dein#add('godlygeek/tabular')
" tabular config {{{
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" call dein#add('')
call dein#add('vim-scripts/ruby-matchit')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-rake')
call dein#add('ujihisa/unite-rake')
call dein#add('sakuma/unite-rails')
:source ~/.vim/config/ruby.vim

call dein#add('tpope/vim-dispatch')
call dein#add('fatih/vim-go')
let g:go_snippet_engine = "neosnippet"  "default ultisnips
" autocmd FileType go autocmd BufWritePre <buffer> GoImports
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>gb <Plug>(go-build)
" au FileType go nmap <leader>gt <Plug>(go-test)
" au FileType go nmap <leader>gc <Plug>(go-coverage)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" au FileType go nmap <Leader>gs <Plug>(go-implements)
" au FileType go nmap <Leader>rn <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:syntastic_go_checkers = ['go', 'golint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['go'] }
set completeopt=menu,preview
call dein#add('hashivim/vim-terraform')
let g:terraform_fmt_on_save = 1
call dein#add('elixir-lang/vim-elixir')
call dein#add('mattreduce/vim-mix')
call dein#add('thinca/vim-visualstar')
call dein#add('easymotion/vim-easymotion')
" ホームポジションに近いキーを使う
:let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" <Leader> + e + (w, k, ...)
:let g:EasyMotion_leader_key="e"
" 1 ストローク選択を優先する
:let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
call dein#add('t9md/vim-textmanip')
call dein#add('kana/vim-textobj-user')
call dein#add('nelstrom/vim-textobj-rubyblock')
call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv')
call dein#add('cohama/agit.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('int3/vim-extradite.git')
call dein#add('mhinz/vim-signify')
call dein#add('scrooloose/nerdtree')
:nnoremap <F3> :NERDTreeToggle<CR>
:let NERDTreeShowHidden = 1
call dein#add('majutsushi/tagbar')
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
call dein#add('tomasr/molokai')
let g:molokai_original = 1
let g:rehash256 = 1

call dein#add('rust-lang/rust.vim')
let g:rustfmt_autosave = 1
set hidden
call dein#add('racer-rust/vim-racer')
let g:racer_cmd = "~/.cargo/bin/racer"

call dein#add('altercation/vim-colors-solarized')
call dein#add('vim-scripts/Colour-Sampler-Pack')
call dein#add('chriskempson/vim-tomorrow-theme')
call dein#add('w0ng/vim-hybrid')
call dein#add('itchyny/lightline.vim')
call dein#add('vim-scripts/xmledit')
call dein#add('Shougo/neomru.vim')
call dein#add('thinca/vim-poslist')
call dein#add('plasticboy/vim-markdown')
let g:vim_markdown_folding_disabled = 1
call dein#add('itspriddle/vim-marked')
call dein#add('zaiste/tmux.vim')
call dein#add('LeafCage/yankround.vim')
call dein#add('kien/ctrlp.vim')
call dein#add('thinca/vim-fontzoom')
call dein#add('vim-scripts/MultipleSearch')
call dein#add('vim-scripts/csv.vim')
call dein#add('Shougo/vimshell.git')
call dein#add('Shougo/vimfiler')
call dein#add('thinca/vim-quickrun')
call dein#add('vim-scripts/grep.vim')
call dein#add('fuenor/qfixhowm')
call dein#add('fuenor/qfixgrep')
call dein#add('thinca/vim-qfreplace')
call dein#add('rking/ag.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('vim-scripts/css_color.vim')
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('mattn/emmet-vim')
call dein#add('othree/html5.vim')
call dein#add('othree/html5-syntax.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('MaxMEllon/vim-jsx-pretty')
let g:vim_jsx_pretty_colorful_config = 1 " default 0
call dein#add('kchmck/vim-coffee-script')
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
call dein#add('leafgarland/typescript-vim')
autocmd BufRead,BufNewFile *.ts set filetype=typescript
call dein#add('tpope/vim-haml')
call dein#add('slim-template/vim-slim')
call dein#add('mattn/webapi-vim')
call dein#add('tell-k/vim-browsereload-mac')
call dein#add('nathanaelkane/vim-indent-guides')
:let g:indent_guides_enable_on_vim_startup=1
:let g:indent_guides_guide_size=1
call dein#add('vim-scripts/AnsiEsc.vim')
call dein#add('osyo-manga/vim-over')
:let g:over_command_line_prompt = "Over Command> "
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

call dein#add('kana/vim-smartinput')
call dein#add('AndrewRadev/switch.vim')
" call dein#add('syui/wauto.vim')
" let g:auto_write = 1
call dein#add('gmarik/sudo-gui.vim')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#end()
" call dein#save_state()
" endif

" Required:
filetype plugin indent on

" if dein#check_install(['vimproc'])
"   call dein#install(['Shougo/vimproc.vim'])
" endif
" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------

for f in split(glob('~/.vim/config/neobundle/*.vim'), '\n')
  exe 'source' f
endfor

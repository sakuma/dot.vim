""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""   Vim Setting
""

" シンタックスハイライト有効化
" 背景黒向け
syntax on

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/Users/sakuma/.pyenv/versions/neovim3/bin/python'

set cursorline " カーソルラインの強調表示を有効化
" highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight cursorline term=reverse cterm=reverse
" highlight BadWhitespace ctermbg=red guibg=red

" 背景白向け
" highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
"highlight Normal ctermbg=grey ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
"highlight CursorLine term=none cterm=none ctermfg=darkgray ctermbg=none

" highlight cursorline term=reverse cterm=reverse
"
"set nohlsearch " 検索キーワードをハイライトしないように設定
set hlsearch " 検索キーワードのハイライト

set ignorecase " 検索時に大文字小文字を区別しない

" 文字コード関連設定
source ~/.vim/config/character.vim

source ~/.vim/config/statusline.vim

source ~/.vim/config/keymap.vim

set backupdir=$HOME/.vim/backup "バックアップファイルを作るディレクトリ
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

""""""""""""""""""
" 行番号
set number

" 行番号表示切り替え(相対表示) - ver7.3 以降から対応
if version >= 703
  noremap  gl :<C-u>ToggleNumber<CR>
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &number
      set relativenumber
    else
      set number
    endif
  endfunction
endif

"クリップボードを連携
set clipboard=unnamed

set noswapfile
" set directory=$HOME/.vim/swaps " スワップファイル用のディレクトリ

set expandtab "タブの代わりに空白文字を挿入する
set hidden "変更中のファイルでも、保存しないで他のファイルを表示
set incsearch "インクリメンタルサーチを行う

"listで表示される文字のフォーマットを指定する
set list
" タブ文字、行末など不可視文字を表示する
set listchars=tab:»-,extends:»,precedes:«,nbsp:%,trail:-,eol:↲

set showmatch "閉じ括弧が入力されたとき、対応する括弧を表示する
set smartcase "検索時に大文字を含んでいたら大/小を区別

set autoindent "新しい行のインデントを現在行と同じにする
set smartindent "新しい行を作ったときに高度な自動インデントを行う
set shiftwidth=2 "シフト移動幅
set smarttab "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set tabstop=2 "ファイル内の <Tab> が対応する空白の数
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set nocompatible   " Disable vi-compatibility
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭，行末で止まらないようにする
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"検索をファイルの先頭へループしない
"set nowrapscan

set mouse=a " マウス機能有効化
" 常に開いているファイルと同じディレクトリをカレントディレクトリにする
" au BufEnter * execute ":lcd " . expand("%:p:h")

" 余計なVimエディタが起動しないようにする
" runtime macros/editexisting.vim

" 文字のないところにもカーソルを移動できる
" all   : all mode (normal, insert, ...)
" block : only visual mode
set virtualedit=all

set belloff=all

" 検索結果ハイライトを ESCキーの連打でリセットする
:nnoremap <ESC><ESC> :nohlsearch<CR>

" vimgrepコマンドで検索したら、検索結果の一覧を自動で開く
augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

set nofoldenable
set colorcolumn=100

" current directory setting
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>


if has('gui_macvim')
    set showtabline=2 " タブを常に表示
    set imdisable " IMを無効化
    set transparency=2 " 透明度を指定
    set antialias
    set guifont=KnackNerdFontC-Regular:h12
    " set guifont=RictyDiscord-Regular:h16
    " set guifontwide=RictyDiscord-Regular:h16
    " set guifont=Monaco:h14
    " set guifont=Ricty:h18
else
  source ~/.vim/config/tabpage.vim
endif

" if has("gui_running")
"   set fuoptions=maxvert,maxhorz
"   au GUIEnter * set fullscreen
" endif

" gvimrc があとから読まれる
" 読まれたく無いファイルには下記の設定を記述
"let plugin_cmdex_disable = 1

if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.config/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif


if dein#load_state(s:dein_dir)
  call dein#begin(expand('~/.vim/dein'))

  let s:toml_dir = expand('~/.vim/config')
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  :source $VIMRUNTIME/macros/matchit.vim

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
 call dein#install()
endif

for f in split(glob('~/.vim/config/neobundle/*.vim'), '\n')
  exe 'source' f
endfor

" source ~/.vim/config/unite.vim

" calendar
source ~/.vim/config/qfixhown-config.vim

" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction

nnoremap <leader>dw :call SearchDash()<CR>

" Open junk file."{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim/junk_files'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction"}}}

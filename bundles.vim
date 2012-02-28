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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""" Vundle自体も管理する
Bundle 'gmarik/vundle'

""" Ruby 関連
Bundle 'ruby.vim'
 
" Bundle 'rails.vim' "autoload でエラーがでるため、下記のbundleを使う
Bundle 'tpope/vim-rails'

""" git plugin
Bundle 'tpope/vim-fugitive'
 
Bundle 'git://git.wincent.com/command-t.git'

" Bundle 'project.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'The-NERD-Commenter'
Bundle 'Shougo/unite.vim'

filetype plugin indent on

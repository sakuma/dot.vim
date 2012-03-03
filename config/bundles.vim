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

""" git plugin
Bundle 'tpope/vim-fugitive'

" Bundle 'git://git.wincent.com/command-t.git'

" Bundle 'project.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'The-NERD-Commenter'
Bundle 'Shougo/unite.vim'
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

filetype plugin indent on

使い方
---------------

# セットアップ

## 事前準備

もし、すでに .vimrc, ~/.vim がある場合、削除するかmvしてbackupをとっておく

> rm .vimrc

> rm -rf ~/.vim

## リポジトリを取得(clone)

> git clone git@github.com:n-sakuma/dot.vim.git ~/.vim

## .vimrc のsymlink をセット

> ln -s ~/.vim/dot.vimrc ~/.vimrc

## pluginのsetup
### vundle 

vim を起動し

:BundleInstall

を実行する。


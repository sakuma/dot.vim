使い方
---------------

# セットアップ

## 事前準備

もし、すでに .vimrc, ~/.vim がある場合、削除するかmvしてbackupをとっておく

> rm .vimrc

> rm -rf ~/.vim

## リポジトリを取得(clone)

> git clone git@github.com:n-sakuma/dot.vim.git ~/.vim


### submodule(vundle.git) の追加

> git submodule init

> git submodule update


## .vimrc のsymlink をセット

> ln -s ~/.vim/dot.vimrc ~/.vimrc


## pluginのsetup
### vundle 

vim (mvim) を起動し

:BundleInstall

を実行して、Bundle で指定したvim script をインストールする


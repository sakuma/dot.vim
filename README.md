使い方
---------------

# セットアップ

## clone

### 事前準備

もし、すでに ~/.vim がある場合、削除するかmv してbackupをとっておく

> rm -rf ~/.vim

### リポジトリを取得

> git clone git@github.com:n-sakuma/dot.vim.git ~/.vim

### .vimrc をセット

> cp ~/.vim/dot.vimrc ~/.vimrc

### submodule をセット

> git submolude init

> git submodule update


### plugin
#### vundle 

vim を起動し

:BundleInstall

を実行する。


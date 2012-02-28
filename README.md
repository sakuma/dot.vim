# セットアップ
---------------

# 事前準備

もし、すでに .vimrc, ~/.vim がある場合、削除するかmvしてbackupをとっておく

> rm .vimrc

> rm -rf ~/.vim

# リポジトリを取得(clone)

> git clone git@github.com:n-sakuma/dot.vim.git ~/.vim

# .vimrc のsymlink をセット

> ln -s ~/.vim/dot.vimrc ~/.vimrc

# Plugin の設定 - vundle管理のplugin をインストール

> cd ~/.vim

> vim -u bundles.vim +BundleInstall +q


## vundle メモ

### インストール

> :BundleInstall

### 更新

> :BundleInstall!

### 検索

> :BundleSearch

### 一覧

> :Bundles


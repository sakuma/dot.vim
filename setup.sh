#!/bin/bash

cat <<-EOS

  Setting up....

EOS

function setup_vim_conf() {
  if [ -f ~/.vimrc ]; then
    mv ~/.vimrc{,.old}
  fi

  cd ~/.vim

  if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim.git bundle/neobundle.vim
  fi

  # Add these colours to ~/.Xresources
  curl https://gist.github.com/w0ng/3278077/raw/4d1d04906349efe4054e314b8a19f027bd537eb1/.Xresources-hybrid > ~/.Xresources

  cat <<-EOS

  ... done!

EOS
}

function update_vim_conf() {
  local vim_dir=$HOME/.vim
  # local vim_dir=/tmp/.vim
  cd $vim_dir
  result=$(git status)
  remote_status=$(echo $result | grep "Your branch is up-to-date with 'origin/master'.")
  commit_status=$(echo $result | grep 'nothing to commit, working directory clean')
  # if [ ( -n "$remote_status" ) && ( -n "commit_status" ) ]; then
  if [ -n "$remote_status" ] && [ -n "$commit_status" ]; then
    git pull origin master
    if [ -n $? ]; then
      $vim_dir/bundle/neobundle.vim/bin/neoinstall
    else
      echo "!!! Failed repository pull"
    fi
  else
    echo "!!! repository is dirty. check it!"
    exit 1
  fi
}

case "$1" in
  install)
    setup_vim_conf
    ;;
  update)
    update_vim_conf
    ;;
  *)
    echo "Unkown command: $1"
    echo "'install' or 'update'"
esac

cat <<-EOS

  Setting up....

EOS

if [ -x ~/.vimrc ]; then
  rm ~/.vimrc
fi

cd ~/.vim
neobundle=$(ls neobundle.vim | wc -l)
if [ $neobundle = 0 ]; then
  git submodule init && git submodule update
else
  git submodule sync
fi

if [ -d ~/.vim/bundle/vimproc ]; then
  cd ~/.vim/bundle/vimproc
  arch=$(uname)
  if [ $arch = 'Darwin' ]; then
    make -f make_mac.mak
    if [ $? = 0 ]; then
      echo "success"
    else
      echo "vim-proc: build faild"
    fi
  fi
fi

if [ ! -x ~/bin ]; then
  mkdir ~/bin
fi

if [ ! -x ~/bin/refe ]; then
  ln -fs ~/.vim/bin/refe ~/bin/refe
fi

if [ ! -x ~/.vim/docs/rubyrefm ]; then
  REFERENCE_FILE='ruby-refm-1.9.2-dynamic-20110729'
  REFERENCE_ARCHIVE_FILE=$REFERENCE_FILE.tar.gz
  cd /tmp && wget http://doc.okkez.net/archives/201107/$REFERENCE_ARCHIVE_FILE
  cd /tmp && tar xvzf $REFERENCE_ARCHIVE_FILE
  mkdir -p ~/.vim/docs/rubyrefm
  mv /tmp/$REFERENCE_FILE ~/.vim/docs/rubyrefm
  rm /tmp/$REFERENCE_ARCHIVE_FILE
fi

if [ ! -e ~/.vimrc ]; then
  ln -fs ~/.vim/dot.vimrc ~/.vimrc
fi

cat <<-EOS

  ... done!

EOS

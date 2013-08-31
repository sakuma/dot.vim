cat <<-EOS

  Setting up....

EOS

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc{,.old}
fi

cd ~/.vim

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  git clone git://github.com/Shougo/neobundle.vim.git bundle/neobundle.vim
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

cat <<-EOS

  ... done!

EOS

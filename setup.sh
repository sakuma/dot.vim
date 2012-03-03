cat <<-EOS

  Setting up....

EOS

cd ~/.vim
if [ ! -x ~/.vim/vundle.git ]; then
  git submodule init
  git submodule update
else
  git submodule sync
fi

if [ ! -x ~/bin ]; then
  mkdir ~/bin
fi

if [ ! -x ~/bin/refe ]; then
  ln -s ~/.vim/bin/refe ~/bin/refe
fi

if [ ! -e ~/.vimrc ]; then
  ln -s ~/.vim/dot.vimrc ~/.vimrc
fi

cat <<-EOS

  ... done!

EOS

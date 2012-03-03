cat <<-EOS

  Setting up....

EOS

if [ -x ~/.vimrc ]; then
  rm ~/.vimrc
fi

cd ~/.vim
vundle_files=$(ls vundle.git | wc -l)
if [ $vundle_files = 0 ]; then
  git submodule init && git submodule update
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

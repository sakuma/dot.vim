cat <<-EOS

  Setting up....

EOS

cd ~/.vim
git submodule init
git submodule update


cp ~/.vim/dot.vimrc ~/.vimrc

cat <<-EOS

  ... done!

EOS

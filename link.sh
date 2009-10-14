#!/bin/sh
link="gdbinit gitconfig inputrc vim zshrc"

for i in $link; do
	ln -fs $(pwd)/$i $HOME/.$i
done

echo "runtime vimrc" > $HOME/.vimrc
echo "runtime gvimrc" > $HOME/.gvimrc

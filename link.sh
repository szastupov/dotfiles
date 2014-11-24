#!/bin/sh
link="gdbinit gitconfig inputrc vim zshrc bashrc pythonstartup hgrc"

for i in $link; do
	ln -fns $(pwd)/$i $HOME/.$i
done

echo "runtime vimrc" > $HOME/.vimrc
echo "runtime gvimrc" > $HOME/.gvimrc

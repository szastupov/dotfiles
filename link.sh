#!/bin/sh
link="gdbinit gitconfig inputrc vim zshrc"

for i in $link; do
	ln -fs $(pwd)/$i $HOME/.$i
done
ln -sf $(pwd)/emacs/emacs.el $HOME/.emacs

echo "runtime vimrc" > $HOME/.vimrc
echo "runtime gvimrc" > $HOME/.gvimrc

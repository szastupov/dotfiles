#!/bin/sh
link="gdbinit gitconfig inputrc vim zshrc screenrc bashrc pythonstartup irssi hgrc"

for i in $link; do
	ln -fns $(pwd)/$i $HOME/.$i
done
ln -sf $(pwd)/emacs/emacs.el $HOME/.emacs

echo "runtime vimrc" > $HOME/.vimrc
echo "runtime gvimrc" > $HOME/.gvimrc

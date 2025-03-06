# don't do anything if non-interactive
case $- in
	*i*) ;;
	  *) return;;
esac

PS1='\u@\h:\w\$ '

EDITOR=/usr/bin/vi

if [ -r ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

if [ ! -f ~/.vimrc ]; then
	touch ~/.vimrc
fi

if [ ! -f ~/.gdbinit ]; then
	echo "set disassembly-flavor intel" > ~/.gdbinit
fi


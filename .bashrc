# don't do anything if non-interactive
case $- in
	*i*) ;;
	  *) return;;
esac

PS1='\u@\h:\w\$ '

if [ "$LC_CTYPE" = "en_US.UTF-8" ]; then
	PS1=$'\[\033[33m\]\xf0\x9f\x9d\xab\[\033[00m\]  \u@\h:\w\$ '
fi

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


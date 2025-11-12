# don't do anything if non-interactive
case $- in
	*i*) ;;
	  *) return;;
esac

PS1='M $(_rc=${?##0};echo ${_rc:+[${_rc}]}) \u@\h:\w\$ '

if [ "$LC_CTYPE" = "en_US.UTF-8" ]; then
	PS1=$'\[\033[33m\]\xf0\x9f\xa5\x95\[\033[00m\] $(_rc=${?##0};echo ${_rc:+[\[\033[31m\]${_rc}\[\033[00m\]]}) \u@\h:\w\$ '
fi

export EDITOR=/usr/bin/vi
export PAGER=/usr/bin/less

if [ -d ~/vim/runtime ]; then
	export VIMRUNTIME=~/vim/runtime
fi

if [ -x ~/vim/src/vim ]; then
	export EDITOR=~/vim/src/vim
fi

if [ -r ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

if [ ! -f ~/.vimrc ]; then
	touch ~/.vimrc
fi

if [ ! -f ~/.gdbinit ]; then
	echo "set disassembly-flavor intel" > ~/.gdbinit
fi

# update history file on each command, regardless of terminal:
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


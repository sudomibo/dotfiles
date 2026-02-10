# don't do anything if non-interactive
case $- in
	*i*) ;;
	  *) return;;
esac

export EDITOR=/usr/bin/vi
export PAGER=/usr/bin/less
export TIME_STYLE="+%Y-%m-%d %H:%M:%S %z"
export CLICOLOR="yes"
export GPG_TTY=$(tty)

if [ -d ~/vim/runtime ]; then
	export VIMRUNTIME=~/vim/runtime
fi

if [ -x ~/vim/src/vim ]; then
	export EDITOR=~/vim/src/vim
fi

if [ -r ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

function requires() {
	declare -p PREREQS &>/dev/null
	if [ "$?" -eq 0 ]; then
		for prereq in "${PREREQS[@]}"; do
			if ! hash "$prereq" 2>/dev/null; then
				echo "[!] $prereq not found but required" >&2
				exit 1
			fi
		done
	fi
}
export -f requires

function update_ps1() {
	PS1='% $(_rc=${?##0};echo ${_rc:+[${_rc}]}) \u@\h:\w'
	if [ "$LC_CTYPE" = "en_US.UTF-8" ]; then
		PS1=$'\[\033[33m\]\xf0\x9f\xa5\x95\[\033[00m\] $(_rc=${?##0};echo ${_rc:+[\[\033[31m\]${_rc}\[\033[00m\]]}) \u@\h:\w'
	fi

	if ! hash "git" 2>/dev/null; then
		PS1="$PS1\n\$ "
	else
		local branch=$(git -C "$PWD" rev-parse --abbrev-ref HEAD 2>/dev/null)
		if [ "$?" -eq 0 ]; then
			if [ -z "$branch" ]; then
				PS1="$PS1\n\$ "
			else
				PS1="$PS1 ($branch)\n\$ "
			fi
		else
			PS1="$PS1 (?)\n\$ "
		fi
	fi
}

# update history file on each command, regardless of terminal:
shopt -s histappend
PROMPT_COMMAND="history -a;update_ps1;$PROMPT_COMMAND"


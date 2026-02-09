# environment variable definitions

PATH=/usr/local/bin:/usr/bin:/sbin:/bin
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export MAN_POSIXLY_CORRECT="1"

if [ -d $HOME/bin ]; then
	export PATH=$PATH:$HOME/bin
fi

if [ -d /opt/homebrew/bin ]; then
	export PATH=/opt/homebrew/bin/:$PATH
fi

if [ -d /usr/local/texlive/2024/bin/universal-darwin ]; then
	export PATH=$PATH:/usr/local/texlive/2024/bin/universal-darwin
fi


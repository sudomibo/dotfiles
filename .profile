# environment variable definitions

PATH=/usr/local/bin:/usr/bin:/bin
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

if [ -d $HOME/bin ]; then
	export PATH=$PATH:$HOME/bin
fi

if [ -d /opt/homebrew/bin ]; then
	export PATH=/opt/homebrew/bin/:$PATH
fi


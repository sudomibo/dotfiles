# environment variable definitions

PATH=/usr/local/bin:/usr/bin:/bin

if [ -d $HOME/bin ]; then
	export PATH=$PATH:$HOME/bin
fi


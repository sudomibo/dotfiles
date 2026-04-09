syntax on

set viminfo+=n~/.vim/viminfo

autocmd BufRead /tmp/vc.*    setlocal ft=changes tw=67
autocmd BufRead *.changes.*  setlocal ft=changes tw=67
autocmd BufRead *.changes    setlocal ft=changes tw=67


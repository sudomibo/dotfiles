syntax on

set backup
set viminfo+=n~/.vim/viminfo
set backupdir=~/.vim//
set directory=~/.vim//

" for files that already had \n at the end:
" $ vim -b file
" :set noeol
" :wq
" otherwise:
set nofixendofline

autocmd BufRead *.md         setlocal ft=markdown tw=67
autocmd BufRead /tmp/vc.*    setlocal ft=changes tw=67
autocmd BufRead *.changes.*  setlocal ft=changes tw=67
autocmd BufRead *.changes    setlocal ft=changes tw=67
autocmd BufRead /tmp/mutt*   setlocal tw=80


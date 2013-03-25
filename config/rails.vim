""""""""""""""""""""""""""""""""""""""""
"" Rails.vim settings
""""""""""""""""""""""""""""""""""""""""

" use 3 spaces, like everything else
autocmd User Rails        setlocal shiftwidth=2
autocmd User Rails        setlocal tabstop=2
autocmd User Rails        setlocal softtabstop=2

map <C-G> :Rtags

set tags=tmp/tags


au BufRead,BufNewFile *.rabl setf ruby

""""""""""""""""""""""""""""""""""""""""
"" Keyboard-command related settings.
"" does not contain plugin-specific
"" settings, just 'global' ones.
""""""""""""""""""""""""""""""""""""""""

function RefreshCTagsAndCmdT()
  :CommandTFlush
  :!ctags -R .
endfunction

" ;w saves a buffer
map <Leader>w :w!<CR>

" ;q closes a vim-window
map <Leader>q :q!<CR>

" navigate among windows using ;[hjkl]
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

" use C-j and C-k to 'bubble' lines (see
" http://vimcasts.org/episodes/bubbling-text/)
map <C-j> ddp
map <C-k> ddkP

" navigate around in buffers...
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

" tabnew
map <C-T> :tabnew<CR>

" map refresh
map <Leader>rr :call RefreshCTagsAndCmdT()<CR>

" close all buffers but this one
map <Leader>bo :BufOnly<CR>

" switch ' and `, because:
" ' jumps to the start of the line where a mark is
" ` jumps to the exact location of a mark
" because jumping to the exact location is more useful,
" I like it to be closer to the home row, so I switch the keys.
noremap ' `
noremap ` '

nnoremap ;; :

" use <Leader>C to display hidden chars
map <Leader>C :set list!<CR>

" toggle for syntax highlighting on/off
:map <F7> :if exists("g:syntax_on") <Bar>
  \   syntax off <Bar>
  \ else <Bar>
  \   syntax enable <Bar>
  \ endif <CR>

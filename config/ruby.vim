""""""""""""""""""""""""""""""""
"" Set Ruby-specific keybindings
""""""""""""""""""""""""""""""""

autocmd FileType ruby  call LoadRubyKeybindings()
autocmd FileType eruby call LoadRubyKeybindings()
autocmd FileType haml  call LoadRubyKeybindings()
autocmd FileType yaml  call LoadRubyKeybindings()

fun LoadRubyKeybindings()
   " bind control-l to hashrocket
   imap <buffer> <C-l> <Space>=><Space>

   " bind control-e to <%= %> similar to Textmate
   imap <buffer> <C-e> %=<Tab>

   " bind control-shift-i to turn the current word into a symbol
   " imap <buffer> <C-k> <C-o>b:<Esc>Ea
   " nmap <buffer> <C-k> lbi:<Esc>E
   imap <buffer> <C-k> <Esc>F"R:<Esc>f"x<Esc>Ea
   nmap <buffer> <C-k> F"R:<Esc>f"x<Esc>E

   " bind control-shift-k to turn a symbol into a string
   imap <buffer> <C-K> <Esc>lbhxcsw'<Esc>Ea
   nmap <buffer> <C-K> lbhxcsw'<Esc>E
endfun

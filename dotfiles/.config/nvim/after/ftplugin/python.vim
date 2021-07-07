setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" Set column to 88 to follow Black formatter
setlocal colorcolumn=88

nnoremap <silent> <leader>rr :!rez-release<CR>
nnoremap <silent> <leader>rrn :!rez-release --no-latest<CR>
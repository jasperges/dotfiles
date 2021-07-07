setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal textwidth=88

" Set column to 88 to follow Black formatter
setlocal colorcolumn=88

" Format file with isort and black on save
let g:neoformat_enabled_python = ['black', 'isort']

" Group autocmd's so they can be removed first. If we don't do this, the same
" autocmd is added every time we open or save a Python file.
augroup filetype_python
    autocmd!
    " Format file with isort and black on save
     autocmd BufWritePre *.py Neoformat
augroup END

" Binding for `rez-release`
nnoremap <silent> <leader>rr :!rez-release<CR>
nnoremap <silent> <leader>rrn :!rez-release --no-latest<CR>

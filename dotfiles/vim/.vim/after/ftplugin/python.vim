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

" Execute the python file with the default Python interpreter
nnoremap <silent> <leader>pp :!python %:p<CR>

" Binding for `rez-release`
nnoremap <silent> <leader>rr :!do-rez-build release %:p<CR>
nnoremap <silent> <leader>rrn :!do-rez-build release %:p --no-latest<CR>
nnoremap <silent> <leader>rb :!do-rez-build build %:p<CR>
nnoremap <silent> <leader>rbo :!do-rez-build build %:p -- overwrite<CR>

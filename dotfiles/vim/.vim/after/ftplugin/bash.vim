setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" Group autocmd's so they can be removed first. If we don't do this, the same
" autocmd is added every time we open or save a bash file.
augroup filetype_bash
    autocmd!
     autocmd BufWritePre * Neoformat
augroup END

" Group autocmd's so they can be removed first. If we don't do this, the same
" autocmd is added every time we open or save a go file.
augroup filetype_go
    autocmd!
     autocmd BufWritePre *.go Neoformat
augroup END


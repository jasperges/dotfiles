setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal textwidth=80
setlocal fdm=manual

" mappings for changing line to heading
nnoremap <silent> <leader>h1 :.!headings -t rst -l 1<CR>
nnoremap <silent> <leader>h2 :.!headings -t rst -l 2<CR>
nnoremap <silent> <leader>h3 :.!headings -t rst -l 3<CR>
nnoremap <silent> <leader>h4 :.!headings -t rst -l 4<CR>
nnoremap <silent> <leader>h5 :.!headings -t rst -l 5<CR>
nnoremap <silent> <leader>h6 :.!headings -t rst -l 6<CR>

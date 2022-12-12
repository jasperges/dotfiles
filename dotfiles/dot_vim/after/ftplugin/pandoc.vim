if exists("*FollowLink")
    finish
endif

function! FollowLink()
    let link = system('md-link-url <<<' . shellescape(getline('.')))
    let currentdir = expand("%:p:h")
    let filepath = currentdir . '/' . link . '.md'
    echo filepath
    if !filereadable(filepath)
        return
    endif
	exec "edit " . fnameescape(filepath)
endfunction

" Set column to 100 to match my preferred line length for writing
setlocal colorcolumn=100

" Never conceal anything on the cursor line
setlocal concealcursor=

command! FollowLink call FollowLink()
nnoremap <silent> <CR> :FollowLink<CR>
nnoremap <script> <BS> :e#<CR>
nnoremap <silent> <leader>pdd :%!date-to-today<CR>
" nnoremap <silent> <leader>pmp :terminal ++hidden md-to-pdf %:p<CR>
nnoremap <silent> <leader>pmp :!md-to-pdf %:p &<CR>
" nnoremap <silent> <leader>ppp :terminal ++hidden setsid md-pdf-preview %:p<CR>
nnoremap <silent> <leader>ppp :!md-pdf-preview %:p &<CR>

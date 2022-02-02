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

command! FollowLink call FollowLink()
nnoremap <silent> <CR> :FollowLink<CR>
nnoremap <script> <BS> :e#<CR>

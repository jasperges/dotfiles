" Add date in specified format at cursor position in a table in vimwiki
nnoremap <silent> <leader>pd mc:read !LC_TIME=nl_NL.utf8 date "+\%Y-\%m-\%d \%a"<CR>"dd$dd`ch"dpa<Tab><ESC>F\|2l
nnoremap <silent> <leader>cd :.-read !LC_TIME=nl_NL.utf8 date "+\%Y-\%m-\%d"<CR>I# <ESC>jo<ESC>

function! TableFold()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart + 1
    let line_text = substitute(line, '\\\/', '  ', 'g')
    let line_text = substitute(line_text, '^|\(\s\+[0-9a-z ]\+\s\+|\s\+[0-9a-z\\\/]\+\s\+\).*$', '\1  ', 'g')
    return ' └▶' . line_text
endfunction

setlocal foldtext=TableFold()
setlocal concealcursor=

" Set column width to 120
set textwidth=120
set colorcolumn=120

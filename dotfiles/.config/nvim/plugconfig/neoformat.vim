let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['black', 'isort']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_html = ['htmlbeautify', 'tidy']
let g:neoformat_enabled_yaml = ['prettier']
nnoremap <Leader>m <esc>:Neoformat<CR>

let g:vimwiki_folding = 'custom'
let vimwiki_path = '~/documents/vimwiki/'
let vimwiki_export_path = '~/documents/vimwiki/export/'
let automatic_nested_syntaxes = 1
let wiki_settings = {
\ 'template_path': vimwiki_export_path.'vimwiki-assets/',
\ 'template_default': 'default',
\ 'template_ext': '.html',
\ 'custom_wiki2html': 'vimwiki_markdown',
\ 'html_filename_parameterization': 1,
\ 'auto_export': 0,
\ 'syntax': 'markdown',
\ 'ext': '.md',
\ }
let wikis = ['werk', 'prive']
let g:vimwiki_list = []
for wiki_name in wikis
    let wiki = copy(wiki_settings)
    let wiki.path = vimwiki_path.wiki_name.'/'
    let wiki.path_html = vimwiki_export_path.wiki_name.'/'
    let wiki.diary_index = 'index'
    let wiki.diary_rel_path = 'diary/'
    call add(g:vimwiki_list, wiki)
endfor

nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up> :m .-2<CR>==

inoremap <M-Down> <Esc>:m .+1<CR>==gi
inoremap <M-Up> <Esc>:m .-2<CR>==gi

 vnoremap <M-Down> :m '>+1<CR>gv=gv
 vnoremap <M-Up> :m '<-2<CR>gv=gv

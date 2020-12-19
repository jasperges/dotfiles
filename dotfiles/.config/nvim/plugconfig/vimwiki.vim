let vimwiki_path = '~/documents/vimwiki/'
let vimwiki_export_path = '~/documents/vimwiki/export/'
let automatic_nested_syntaxes = 1
let wiki_settings = {
\ 'template_path': vimwiki_export_path.'vimwiki-assets/',
\ 'template_default': 'default',
\ 'template_ext': '.html',
\ 'auto_export': 0,
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

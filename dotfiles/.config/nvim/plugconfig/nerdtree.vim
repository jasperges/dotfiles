map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$[[file]]', 'build$[[dir]]', '__pycache__$[[dir]]', '\.mypy_cache$[[dir]]']

set encoding=utf-8

" Install Plug and plugins if needed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug
call plug#begin('~/.vim/plugged')
" Python stuff
Plug 'davidhalter/jedi-vim'
Plug 'ctrlpvim/ctrlp.vim'

" Miscellaneous stuff
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
" Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/restore_view.vim'
Plug 'ervandew/supertab'
Plug 'vim-scripts/AutoComplPop'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mgedmin/python-imports.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'othree/html5.vim'
" Plug 'fatih/vim-go'
" Plug 'garbas/vim-snipmate'

Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'greg-js/vim-react-es6-snippets'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Auto close brackets etc.
Plug 'Raimondi/delimitMate'

" Jinja
Plug 'HiPhish/jinja.vim'

" Javascript plugins
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'ternjs/tern_for_vim'
Plug 'othree/yajs'
" Plug 'othree/es.next.syntax'
Plug 'mxw/vim-jsx'

" Plug 'Valloric/YouCompleteMe'
" Plug 'AutoClose'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'sbdchd/neoformat'
" Plug 'HTML-AutoCloseTag'
" Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'

" Restructured text
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'

Plug 'peterhoeg/vim-qml'
Plug 'kovetskiy/sxhkd-vim'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" Better tables and to-do's
Plug 'dhruvasagar/vim-table-mode'
Plug 'dhruvasagar/vim-dotoo'

call plug#end()

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Japsers dingetjes
nnoremap <Space> <Nop>
" sunmap <Space>
" map <Space> <Leader>
" edit vimrc quickly
let mapleader=" "
map <leader>v :sp ~/.vimrc<CR>
" reload vimrc when saved
au BufWritePost .vimrc source ~/.vimrc
let g:python_recommended_style = 0
set number
set modeline
set listchars=eol:¬,tab:>―,space:·
set conceallevel=2
map <M-Right> :bn<CR>
map <M-Left> :bp<CR>

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

set shiftround
set expandtab
set autoread    " reload file when changes happen in another editor
" make yank copy to the global system clipboard
set clipboard+=unnamedplus
" Fast navigation between tabs
" map <Leader>, <esc>:tabprevious<CR>
" map <Leader>. <esc>:tabnext<CR>
" better indentation for code blocks
vnoremap < <gv
vnoremap > >gv
" Delete comment character when joining commented lines
set formatoptions+=j
" Use '<Leader>hl' to toggle hlsearch.
nnoremap <silent> <Leader>hl <esc>:set invhlsearch<CR>
set laststatus=2
" Map TagList toggle to <leader> t
nnoremap <Leader>t <esc>:Tlist<CR>
let g:Tlist_Inc_Winwidth = 1
let g:Tlist_WinWidth = 56

" Synstastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['python', 'flake8', 'pep8', 'pylint', 'pyflakes']
let g:syntastic_python_checkers = ['pylint']
" Append flake8 as checker if a '.flake8' config can be found
autocmd FileType python let b:syntastic_checkers = findfile('.flake8', '.;') != '' ? g:syntastic_python_checkers + ['flake8'] : g:syntastic_python_checkers
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_html_checkers = ['htmlbeautify']
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 10
" let g:syntastic_python_pylint_args =
"     \ '--max-line-length=120 --extension-pkg-whitelist=PySide,shiboken'
" let g:syntastic_python_pylint_args = '--extension-pkg-whitelist=PySide'
" let g:syntastic_python_flake8_args = '--max-line-length=120'
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": [] }
nnoremap <Leader>sc <esc>:SyntasticCheck<CR>
nnoremap <Leader>sm <esc>:SyntasticCheck mypy<CR>
nnoremap <Leader>sr <esc>:SyntasticReset<CR>

" Show trailing whitespace
" =========================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader>x :%s/\s\+$//<CR>
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set backup            " keep a backup file (restore to previous version)
set nobackup
set undofile            " keep an undo file (undo changes after closing)
set history=700         " keep 700 lines of command line history
set undolevels=700
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" Awesome line number magic
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <Leader>l :call NumberToggle()<cr>
:au FocusLost * set number
:au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
set relativenumber

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    " filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent                " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If unset (default), this may break plugins (but it's backward
    " compatible).
    set langnoremap
endif

" Color column at 80 and 120
set colorcolumn=80,120

" Fold settings
" augroup vimrc
"     au BufReadPre * setlocal foldmethod=indent
"     au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END
set foldnestmax=4
set foldcolumn=4
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Search and replace mappings
nnoremap <Leader>f :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <Leader>F :,$s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" CtrlP options
nnoremap <leader>. :CtrlPTag<CR>
let g:ctrlp_custom_ignore = '\v[\/]node_modules'

" tags
set tags+=tags;/,.git/tags;/

" Case sensitivity
set ignorecase
set smartcase

" view settings
set viewoptions=cursor,folds,slash,unix

" run file with python
autocmd FileType python nnoremap <buffer> <Leader>p :exec '!python' shellescape(@%, 1)<CR>

" autocomplete for html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" autocomplete for javascript
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" Autocomplete snippets
" fun! GetSnipsInCurrentScope()
"     let snips = {}
"     for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
"         call extend(snips, get(s:snippets, scope, {}), 'keep')
"         call extend(snips, get(s:multi_snips, scope, {}), 'keep')
"     endfor
"     return snips
" endf
" let g:acp_behaviorSnipmateLength = 1

set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set cursorline
set cursorcolumn
nmap <Leader>c <Plug>ToggleAutoCloseMappings

" vim-markdown settings
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extension_in_markdown = 1
let g:vim_markdown_autowrite = 1

" Neoformat
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['yapf', 'isort']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_html = ['htmlbeautify', 'tidy']
let g:neoformat_enabled_yaml = ['prettier']
" let g:neoformat_python_yapf = {
"         \ 'exe': 'yapf',
"         \ 'args': ['--style="{based_on_style: pep8, column_limit: 100, indent_dictionary_value: true, allow_split_before_dict_value: false, each_dict_entry_on_separate_line: false}"'],
"         \ 'stdin': 1,
"         \ }
nnoremap <Leader>m <esc>:Neoformat<CR>

" delimitMate
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

" JSX syntax highlighting
let g:jsx_ext_required=0

" emmet-vim
let g:user_emmet_settings = {
\    'js': {
\      'extends': 'html',
\    },
\}

" riv (restructured text)
let g:riv_fold_auto_update=0

" Fugitive
nnoremap <Leader>gs <esc>:Gstatus<CR>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$']

" Instant Markdown
" Uncomment to override defaults:
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
" let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" let g:instant_markdown_autoscroll = 0
" let g:instant_markdown_browser = "firefox --new-window"

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
                \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Set IBeam shape in insert mode, underline shape in replace mode and block shape in normal mode.
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Splits open at the bottom and the right
set splitbelow splitright

" Shortcuts for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Enable Goyo (distraction free writing) for writing email
" autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=100
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|x!<CR>

"Run xrdb when Xdefaults or Xresources are updated
autocmd BufWritePost *Xdefaults,*Xresources !xrdb %
" Update binds when sxhkdrc is updated
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" vim: set ts=4 sw=4 tw=78 et :

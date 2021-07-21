set encoding=utf-8

set nocompatible

" Install Plug and plugins if needed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plug
call plug#begin('~/.vim/plugged')
" Colors
Plug 'altercation/vim-colors-solarized'
" Mandatory tpope plug-ins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git gutter
Plug 'airblade/vim-gitgutter'
" CSS colors
Plug 'ap/vim-css-color'
" Collection of language packs
Plug 'sheerun/vim-polyglot'
" Support for sxhkd config file
" Plug 'kovetskiy/sxhkd-vim'
" Distraction free writing
Plug 'junegunn/goyo.vim'
"VimWiki
Plug 'vimwiki/vimwiki'
" Vim syntax for TOML
" Plug 'cespare/vim-toml'
" Powershell
" Plug 'PProvost/vim-ps1'
" Indentline
Plug 'Yggdroot/indentLine'
" Buffer explorer
Plug 'jlanzarotta/bufexplorer'
" Tags
Plug 'ludovicchabant/vim-gutentags'
" Neoformat
Plug 'sbdchd/neoformat'
" Restore view
Plug 'vim-scripts/restore_view.vim'
" UltiSnip Snippets, can be used by coc-snippets
Plug 'honza/vim-snippets'
" Restructured text
" Plug 'gu-fan/riv.vim'
" Plug 'gu-fan/InstantRst'
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Don't keep a backup file
set nobackup
" Keep an undo file (undo changes after closing)
set undofile

" Change cursor shape to bar in insert mode
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Hide buffer when it is abandoned
" set hidden

" Make yank copy to the global system clipboard
set clipboard^=unnamed
if has('unnamedplus')
    set clipboard^=unnamedplus
endif

" Set line numbers
set number relativenumber

" White space characters
set listchars=eol:¬,tab:>―,space:·

" Set conceal level
set conceallevel=2

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

" Tab Settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Enable mouse support
set mouse=a

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Color column and cursor lines
set colorcolumn=80
set cursorline
set cursorcolumn

" Tags
set tags+=.git/tags;

" Case sensitivity
set ignorecase
set smartcase

" Splits open at the bottom and the right
set splitbelow splitright

" Set leader key to space
nnoremap <Space> <Nop>
let mapleader=" "

" Edit vim config quickly
noremap <leader>v :exec ':e ~/.vimrc'<CR>
" Reload vim config when saved
autocmd BufWritePost .vimrc exec 'source ~/.vimrc'
" Quickly source vimrc
noremap <leader>vv :exec ':source ~/.vimrc'<CR>

" Shortcuts for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Folding options
set foldnestmax=4
set foldcolumn=4
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Search and replace mappings
" fa for find and replace **a**ll
" ff for find and replace **f**orward
nnoremap <Leader>fa :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <Leader>ff :,$s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" open/close location list
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>

" Move to next or previous buffer with Alt + → and Alt + ←
map <M-Right> :bn<CR>
map <M-Left> :bp<CR>

" Better indentation for code blocks
vnoremap < <gv
vnoremap > >gv

" Use '<Leader>hl' to stop highlighting until the next search command
set hlsearch
nnoremap <silent> <Leader>hl :nohlsearch<CR>

" Show trailing whitespace
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"Run xrdb when Xdefaults or Xresources are updated
autocmd BufWritePost *Xdefaults,*Xresources :silent !xrdb %
" Update binds when sxhkdrc is updated
autocmd BufWritePost *sxhkdrc :silent !pkill -USR1 sxhkd
" Restart picom when the config is update
autocmd BufWritePost picom.conf :silent !pkill -USR1 picom

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
                \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <leader>ml :call AppendModeline()<CR>

" Colors
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Plug-in configurations

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$[[file]]', 'build$[[dir]]', '__pycache__$[[dir]]', '\.mypy_cache$[[dir]]']

" vim-fugitive
nnoremap <Leader>gs <esc>:Git<CR>

" fzf
nnoremap <C-p> :Files<CR>

" goyo
" Enable Goyo (distraction free writing) for writing email
" autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=100
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile *.py :let g:goyo_width=120
autocmd BufRead,BufNewFile *.py :let g:goyo_linenr=2
nnoremap <silent> <Leader>gy :Goyo<CR>

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" vim wiki
let g:vimwiki_global_ext = 0
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

" Move (selected) lines up and down
nnoremap <M-Down> :m .+1<CR>
nnoremap <M-Up> :m .-2<CR>

inoremap <M-Down> <Esc>:m .+1<CR>gi
inoremap <M-Up> <Esc>:m .-2<CR>gi

vnoremap <M-Down> :m '>+1<CR>gv
vnoremap <M-Up> :m '<-2<CR>gv

" indent line
nnoremap <silent> <leader>lt <esc>:IndentLinesToggle<CR>
nnoremap <silent> <leader>ls <esc>:LeadingSpaceToggle<CR>
let g:indentLine_fileTypeExclude=['json', 'vimwiki']
let g:indentLine_bufTypeExclude=['help', 'terminal']

" neoformat
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['black', 'isort']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_html = ['htmlbeautify', 'tidy']
let g:neoformat_enabled_yaml = ['prettier']
nnoremap <Leader>m <esc>:Neoformat<CR>

" coc

" coc settings
let g:coc_config_home = '~/.config/coc'

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-go',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-rls',
    \ 'coc-snippets',
    \ 'coc-yaml',
    \ ]

" Some servers have issues with backup files, see #649
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gl :CocDiagnostics<CR>

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" CoC snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)

" Make <tab> used for trigger completion, completion confirm, snippet expand
" and jump like VSCode.

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" vim: set ts=4 sw=4 tw=78 et :

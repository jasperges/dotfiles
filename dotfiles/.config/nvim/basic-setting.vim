set encoding=utf-8

" Don't keep a backup file
set nobackup
" Keep an undo file (undo changes after closing)
set undofile

" Hide buffer when it is abandoned
" set hidden

" Make yank copy to the global system clipboard
set clipboard+=unnamedplus

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

" Edit neovim config quickly
noremap <leader>v :exec ':e ' . stdpath("config") . '/init.vim'<CR>
noremap <leader>vb :exec ':e ' . stdpath("config") . '/basic-setting.vim'<CR>
" Reload neovim config when saved
autocmd BufWritePost init.vim exec 'source ' . stdpath("config") . '/init.vim'
autocmd BufWritePost basic-setting.vim exec 'source ' . stdpath("config") . '/basic-setting.vim'
autocmd BufWritePost plugins.vim exec 'source ' . stdpath("config") . '/plugins.vim'
" Quickly source vimrc
noremap <leader>vv :exec ':source ' . stdpath("config") . '/init.vim'<CR>

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

" Move to next or previous buffer with Alt + → and Alt + ←
map <M-Right> :bn<CR>
map <M-Left> :bp<CR>

" Better indentation for code blocks
vnoremap < <gv
vnoremap > >gv

" Use '<Leader>hl' to stop highlighting until the next search command
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

" Enable per project .nvimrc files
set exrc
set secure

" vim: set ts=4 sw=4 tw=78 et :

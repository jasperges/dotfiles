" Install Plug and plugins if needed
if empty(glob(stdpath("data") . '/site/autoload/plug.vim'))
    silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | exec 'source ' . stdpath("config") . '/init.vim'
endif

" Plug
call plug#begin(stdpath("data") . '/plugged')
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
" Support for sxhkd config file
Plug 'kovetskiy/sxhkd-vim'
" Distraction free writing
Plug 'junegunn/goyo.vim'
"VimWiki
Plug 'vimwiki/vimwiki'
" Vim syntax for TOML
Plug 'cespare/vim-toml'
" Powershell
Plug 'PProvost/vim-ps1'
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
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

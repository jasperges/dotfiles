if !exists('g:vscode')
    exec 'source ' . stdpath("config") . '/plugins.vim'
    exec 'source ' . stdpath("config") . '/basic-setting.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/vim-airline.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/nerdtree.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/vim-fugitive.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/fzf.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/goyo.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/vimwiki.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/indent-line.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/coc.vim'
    exec 'source ' . stdpath("config") . '/plugconfig/neoformat.vim'
endif

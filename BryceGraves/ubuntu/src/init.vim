call plug#begin()

" Provides fzf commands and automagically keeps the binary up to date for us
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Used to align selected text elements
Plug 'junegunn/vim-easy-align'

" Used to generate syntax trees
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colored bracked pairs, this is a plugin for treesitter
Plug 'HiPhish/nvim-ts-rainbow2'

" Color hex values in code
Plug 'NvChad/nvim-colorizer.lua'

" Used to mock indent rainbow
Plug 'lukas-reineke/indent-blankline.nvim'

" Multi curser support"
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Theme
Plug 'navarasu/onedark.nvim'

" Update terminal background on startup to avoid annoying black borders
Plug 'typicode/bg.nvim'

" Git support including blame and highlighting
" TODO: there might be other better options, but let's see how this works for
" now
Plug 'lewis6991/gitsigns.nvim'

" Used to style the bottom status bar. Trying this out over airline
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'

" File explorer package... kind of love the main branch is chad
" TODO: check in on this agian in the future when it is more stable... or
" maybe see about helping out
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

call plug#end()

:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/nvim_treesitter_config.lua
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/gitsigns_config.lua
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/lualine_config.lua

" The theme is enabled in the config
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/onedark_config.lua

" Needs to be loaded after one dark styles to prevend overriding the styles
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/indent_blankline_config.lua

" Show line numbers
set number
set ruler

" Enable highlighting of the current line
set cursorline

" Always keep gitsign gutter
set signcolumn=yes:1

" Use 2 spaces for indent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2


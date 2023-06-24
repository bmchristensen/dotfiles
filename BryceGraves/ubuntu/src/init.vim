call plug#begin()

" Used to generate syntax trees
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Colored bracked pairs, this is a plugin for treesitter
Plug 'HiPhish/nvim-ts-rainbow2'
" Used to mock indent rainbow
Plug 'lukas-reineke/indent-blankline.nvim'
" Multi curser support"
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Theme
Plug 'navarasu/onedark.nvim'
" Git support including blame and highlighting
" TODO: there might be other better options, but let's see how this works for
" now
Plug 'lewis6991/gitsigns.nvim'

" Used to style the bottom status bar. Trying this out over airline
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/nvim_treesitter_config.lua
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/gitsigns_config.lua
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/lualine_config.lua

" The theme is enabled in the config
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/onedark_config.lua

" Needs to be loaded after one dark styles to prevend overriding the styles
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/indent_blankline_config.lua

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

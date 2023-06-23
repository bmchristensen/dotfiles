call plug#begin()

" Used to generate syntax trees"
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Colored bracked pairs, this is a plugin for treesitter
Plug 'HiPhish/nvim-ts-rainbow2'
" Used to mock indent rainbow"
Plug 'lukas-reineke/indent-blankline.nvim'
" Multi curser support"
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Theme
Plug 'navarasu/onedark.nvim'

call plug#end()

colorscheme onedark

:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/indent_blankline_config.lua
:source /home/bryceg/Code/dotfiles/BryceGraves/ubuntu/src/nvim_treesitter_config.lua


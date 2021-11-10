-- reference: https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'neovim/nvim-lspconfig'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Auto Close Bracket
Plug 'cohama/lexima.vim'

-- Git Client
Plug 'tpope/vim-fugitive'

-- Colors
Plug 'sainnhe/sonokai'

-- Javascript
Plug 'prettier/vim-prettier'

-- File navigation
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

vim.call('plug#end')

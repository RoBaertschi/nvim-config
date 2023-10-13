set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set number
set showmatch
set ignorecase
set smartcase
set autoindent
set cursorline

set relativenumber

let mapleader=" "

call plug#begin()

Plug 'numToStr/FTerm.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'phanviet/vim-monokai-pro'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'm4xshen/autoclose.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'nvimtools/none-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'folke/neodev.nvim'
call plug#end()

colorscheme monokai_pro

map <leader>et :NvimTreeToggle<CR>
map <leader>ef :NvimTreeFocus<CR>
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable    
lua << END
vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  client.server_capabilities.semanticTokensProvider = nil
end)

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

require('nvim-tree').setup()
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup {
  ensure_installed = {},
  handlers = {lsp_zero.default_setup},
}

require'cmp'.setup {
  sources = {
    { name = 'nvim_lua' }
  }
}

require('autocmp')
require('formatterconfig')
require('keybindings')

require('autoclose').setup()
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('tree-sitter-nvim')
END



local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath('data') .. '/site/pack'

-- ensure a given plugin from github.com/<user>/<repo> is cloned in the pack/packer/start directory
local function ensure (user, repo)
  local install_path = fmt('%s/packer/start/%s', pack_path, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt('!git clone https://github.com/%s/%s %s', user, repo, install_path))
    execute(fmt('packadd %s', repo))
  end
end

-- ensure the plugin manager is installed
ensure('wbthomason', 'packer.nvim')

require('packer').startup(function(use)
  -- install all the plugins you need here

  -- plenary
  use {'nvim-lua/plenary.nvim'}

  -- the plugin manager can manage itself
  use {'wbthomason/packer.nvim'}

  -- treesitter for syntax highlighting and more
  use {'nvim-treesitter/nvim-treesitter'}

  -- file explorer
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

  -- vim-vinegar
  use {'tpope/vim-vinegar'}

  -- fuzzy finder
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- lsp
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'glepnir/lspsaga.nvim', branch = 'main'}

  use {'onsails/lspkind.nvim'}

  -- cmp framework for auto-completion support
  use {'hrsh7th/nvim-cmp'}

  -- install different completion source
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}

  -- snippets
  use {'L3MON4D3/LuaSnip'} -- snippet engine
  use {'saadparwaiz1/cmp_luasnip'} -- for autocompletion
  use {'rafamadriz/friendly-snippets'} -- useful snippets

  -- colorscheme
  use {'navarasu/onedark.nvim'}
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- elixir
  use { 'elixir-tools/elixir-tools.nvim', requires = { 'nvim-lua/plenary.nvim' }}
  -- use {'brendalf/mix.nvim'}

  -- surround
  use {'tpope/vim-surround'}

  -- auto closing
  use {'windwp/nvim-autopairs'}
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'} 

  -- git
  use('lewis6991/gitsigns.nvim') -- show line modifications on left hand side

  -- trailing whitepsace
  use 'echasnovski/mini.trailspace'
end)

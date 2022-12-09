local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

local function ensure (user, repo)
  local install_path = fmt("%s/packer/start/%s", pack_path, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

ensure("wbthomason", "packer.nvim")

require('packer').startup(function(use)
  -- plenary
  use {'nvim-lua/plenary.nvim'}

  -- package manager
  use {'wbthomason/packer.nvim'}

  -- syntax highlighting
  use {'nvim-treesitter/nvim-treesitter'}

  -- file explorer
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

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

  -- completion sources
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- colorscheme
  use {'navarasu/onedark.nvim'}

  -- elixir
  use {'mhanberg/elixir.nvim'}

  -- surround
  use {'tpope/vim-surround'}

  -- misc
  use {'windwp/nvim-autopairs'}
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'} 
end)

require('elixir').setup()

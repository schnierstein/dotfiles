local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'christoomey/vim-tmux-navigator'

  use "github/copilot.vim"

  use { "ibhagwan/fzf-lua",
  -- optional for icon support
  requires = { "nvim-tree/nvim-web-devicons" }
  }
  use {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          "neovim/nvim-lspconfig",
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
  })
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'mhartington/formatter.nvim'
  use 'stevearc/oil.nvim'
  use {
      "folke/todo-comments.nvim",
      requires = {"nvim-lua/plenary.nvim"}
  }
  use "nvim-lua/plenary.nvim"
  use 'lervag/vimtex'
  use "ThePrimeagen/harpoon"
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.esupports.metagen"] = {
                    config = {
                        type = "empty",
                        timezone = "utc",
                    },
                }, -- Loads default behaviour
                ["core.concealer"] = {
                    config = {
                        icon_preset = "diamond"
                    },
                }, -- Adds pretty icons to your documents
                ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]"} },
                --["core.integration.nvim-cmp"] = {},
                --["core.keybinds"] = {
                --    config = {
                --        default_keybinds = true,
                --        neorg_leader = "<Leader><Leader",
                --    },
                --},
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            zettel = "~/notes/zettel",
                            work = "~/notes/work",
                            privat = "~/notes/privat",
                            test = "~/notes/test",
                            knowledge_base = "~/notes/knowledge_base",
                        },
                    },
                },
            },
        }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }

  -- use {
  --       'nvim-telescope/telescope.nvim', tag = '0.1.4',
  --       requires = { {'nvim-lua/plenary.nvim'} }
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

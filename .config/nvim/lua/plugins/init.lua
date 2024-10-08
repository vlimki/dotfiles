local cmd = vim.cmd

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = false,
          use_languagetree = true
        },
        indent = {enable = true},
        additional_vim_regex_highlighting = false
      }
    end
  },
  {
    "RRethy/base16-nvim"
  },
	{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
		config = function()
			require('Comment').setup()
		end,
	},
	{ 
		'vlyr/nordic.nvim',
		config = function()
			require('nordic').setup {
				theme = "onedark",
			}
		end
	},
  {
    'akinsho/bufferline.nvim',
    version = "*",
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins/bufferline')
    end
  },
  'frabjous/knap',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins/gitsigns')
    end
  },
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      require('haskell-tools')
    end
  },
  "savq/melange-nvim",
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = false,
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
       return require('plugins/cmp')
     end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      require('plugins/lsp')
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins/tree')
    end
  },
  {
    event = "InsertEnter",
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}


local cmd = vim.cmd

return {
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require'nvim-treesitter.configs'.setup {
				highlight = {
					enable = true
				}
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
		  dependencies = 'mfussenegger/nvim-dap',
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
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  dependencies = { 'nvim-lua/plenary.nvim' }
  }
}

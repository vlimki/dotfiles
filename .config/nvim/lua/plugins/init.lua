local cmd = vim.cmd

return {
	{
		'vlyr/nordic.nvim',
		config = require('plugins/nordic')
	},
	--{
		--'nvim-focus/focus.nvim',
		--config = function()
			--require('focus').setup({ ui = {nowrap = true}})
		--end
	--},
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

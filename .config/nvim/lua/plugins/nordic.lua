function x ()
	require 'nordic'.setup {
		theme = 'onedark',
		transparent_bg = true,
		override = {
			CmpBorder = {
				fg = "#1e222a"
			},
			CmpDocBorder = {
				fg = "#1e222a"
			},
			Keyword = {
				fg = "#bf616a"
			},
			Operator = {
				fg = "#bf616a"
			}
		}
	}

	vim.cmd.colorscheme 'nordic'
end

return function()
end


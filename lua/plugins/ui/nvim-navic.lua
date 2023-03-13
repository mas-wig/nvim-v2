return {
	"SmiteshP/nvim-navic",
	lazy = true,
	init = function()
		vim.g.navic_silence = true
		require("setup.utils").on_attach(function(client, buffer)
			if client.server_capabilities.documentSymbolProvider then
				require("nvim-navic").attach(client, buffer)
			end
		end)
	end,
	opts = function()
		return {
			separator = "   ",
			highlight = true,
			depth_limit = 7,
			icons = require("helper.icons").winbar,
		}
	end,
}

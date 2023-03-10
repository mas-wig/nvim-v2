return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	lazy = true,
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Delete all Notifications",
		},
	},
	opts = {
		background_colour = "#000000",
		timeout = 3000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
	},
	init = function()
		local Util = require("setup.utils")
		if not Util.has("noice.nvim") then
			Util.on_very_lazy(function()
				vim.notify = require("notify")
			end)
		end
	end,
}

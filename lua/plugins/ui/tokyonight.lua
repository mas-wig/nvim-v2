return {
	"folke/tokyonight.nvim",
	event = "VimEnter",
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = true, bold = true },
				variables = { italic = false },
				sidebars = "dark",
				floats = "",
			},
			sidebars = { "qf", "help", "terminal", "toggleterm", "lazy", "NvimTree", "trouble" },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = false,
			on_highlights = function(highlights, _)
				local hl_set = require("helper.highlights")
				for _, hl in pairs(hl_set) do
					highlights[hl[1]] = hl[2]
				end
			end,
		})

		vim.cmd("colorscheme tokyonight")
	end,
}

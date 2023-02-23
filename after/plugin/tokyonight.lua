local present, tokyonight = pcall(require, "tokyonight")

if not present then
	return
end

tokyonight.setup({
	style = "night",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = true },
		variables = { italic = false },
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "help" },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,
	on_highlights = function(highlights, _)
		for _, hl in pairs(require("after.highlights")) do
			highlights[hl[1]] = hl[2]
		end
	end,
})

vim.cmd("colorscheme tokyonight")

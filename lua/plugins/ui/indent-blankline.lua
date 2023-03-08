return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("indent_blankline").setup({
			filetype_exclude = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"notify",
				"TelescopePrompt",
			},
			char = "│",
			show_current_context = false,
			show_current_context_start = false,
			use_treesitter = true,
			show_trailing_blankline_indent = false,
			use_treesitter_scope = true,
		})
	end,
}

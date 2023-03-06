return {
	"ray-x/navigator.lua",
	branch = "master",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	dependencies = {
		"ray-x/guihua.lua",
		branch = "master",
		lazy = true,
		build = "cd lua/fzy && make",
	},
	config = function()
		return require("navigator").setup({
			border = "rounded",
			ts_fold = true,
			default_mapping = false,
			transparency = 100,
			lsp_signature_help = false,
			lsp = {
				disable_lsp = "all",
				diagnostic = {
					underline = true,
					virtual_text = true,
					update_in_insert = true,
				},
				diagnostic_virtual_text = true,
				diagnostic_update_in_insert = true,
				disply_diagnostic_qf = true,
			},
		})
	end,
}

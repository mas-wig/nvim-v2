return {
	"rest-nvim/rest.nvim",
	ft = { "http" },
	cmd = { "RestNvim", "RestNvimPreview", "RestNvimLast" },
	keys = { { "<leader>rs", "<Plug>RestNvim<cr>", "Run Under Cursor Rest" } },
	config = function()
		return require("rest-nvim").setup({
			result_split_horizontal = false,
			result_split_in_place = false,
			skip_ssl_verification = false,
			encode_url = true,
			highlight = {
				enabled = true,
				timeout = 300,
			},
			result = {
				show_url = false,
				show_http_info = true,
				show_headers = true,
				formatters = {
					html = function(body)
						return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
					end,
					json = "jq",
				},
			},
		})
	end,
}

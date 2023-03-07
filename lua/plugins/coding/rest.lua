return {
	"rest-nvim/rest.nvim",
	ft = { "http" },
	config = function()
		return require("rest-nvim").setup({
			result_split_horizontal = false,
			result_split_in_place = false,
			skip_ssl_verification = false,
			encode_url = true,
			highlight = {
				enabled = true,
				timeout = 150,
			},
			result = {
				show_url = true,
				show_http_info = true,
				show_headers = true,
				formatters = {
					json = "jq",
					html = function(body)
						return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
					end,
				},
			},
		})
	end,
}

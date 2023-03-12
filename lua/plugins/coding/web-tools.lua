return {
	"ray-x/web-tools.nvim",
	cmd = {
		"BrowserSync",
		"BrowserOpen",
		"BrowserPreview",
		"BrowserRestart",
		"Browserstop",
		"TagRename",
		"HurlRun",
	},
	config = function()
		return require("web-tools").setup({
			keymaps = {
				rename = nil,
				repeat_rename = ".",
			},
			hurl = {
				show_headers = false,
				floating = false,
				formatters = {
					json = { "jq" },
					html = { "prettier", "--parser", "html" },
				},
			},
		})
	end,
}

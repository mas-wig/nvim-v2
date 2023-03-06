return {
	"jose-elias-alvarez/typescript.nvim",
	ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	config = function()
		local on_attach = require("setup.utils").on_attach(function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			require("plugins.lsp.config.lsp-keymaps").on_attach(client, bufnr)
		end)
		return require("typescript").setup({
			disable_commands = false,
			debug = false,
			go_to_source_definition = {
				fallback = true,
			},
			server = {
				on_attach = on_attach,
			},
		})
	end,
}

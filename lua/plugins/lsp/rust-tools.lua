return {
	"simrat39/rust-tools.nvim",
	ft = { "rust" },
	config = function()
		local on_attach = require("setup.utils").on_attach(function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			require("plugins.lsp.config.lsp-keymaps").on_attach(client, bufnr)
		end)
		return require("rust-tools").setup({
			on_attach = on_attach,
			inlay_hints = { auto = false },
			hover_actions = { border = "rounded" },
		})
	end,
}

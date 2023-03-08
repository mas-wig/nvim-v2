return {
	"ray-x/go.nvim",
	branch = "master",
	ft = { "go" },
	build = ":GoInstallBinaries",
	dependencies = {
		"ray-x/guihua.lua",
		branch = "master",
		build = "cd lua/fzy && make",
		lazy = true,
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		return require("go").setup({
			goimport = "goimports",
			lsp_cfg = {
				capabilities = capabilities,
			},
			lsp_on_attach = function()
				require("setup.utils").on_attach(function(client, bufnr)
					require("plugins.lsp.config.lsp-keymaps").on_attach(client, bufnr)
				end)
			end,
			lsp_document_formatting = true,
			lsp_inlay_hints = {
				enable = false,
			},
			luasnip = true,
			lsp_diag_update_in_insert = true,
			lsp_keymaps = false,
			dap_debug = false,
		})
	end,
}

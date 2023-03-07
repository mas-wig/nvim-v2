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
			dap_debug_gui = {
				layouts = {
					{
						elements = {
							{ id = "watches", size = 0.20 },
							{ id = "stacks", size = 0.30 },
							{ id = "breakpoints", size = 0.30 },
							{ id = "scopes", size = 0.30 },
						},
						size = 64,
						position = "right",
					},
					{
						elements = {
							"repl",
							"console",
							"watches",
						},
						size = 0.30,
						position = "bottom",
					},
				},
			},
			dap_debug_vt = { enabled_commands = true, all_frames = true },
		})
	end,
}

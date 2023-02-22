return {
	{
		"ray-x/navigator.lua",
		event = { "BufReadPre", "BufNewFile" },
		branch = "master",
		config = function()
			require("plugins.lsp.navigator")
		end,
		dependencies = {
			{
				"ray-x/guihua.lua",
				build = "cd lua/fzy && make",
				lazy = true,
				branch = "master",
			},
			{
				"neovim/nvim-lspconfig",
				lazy = true,
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					{
						"hrsh7th/cmp-nvim-lsp",
						lazy = true,
						cond = function()
							return require("setup.utils").has("nvim-cmp")
						end,
					},
				},
			},
			{
				"williamboman/mason.nvim",
				cmd = {
					"Mason",
					"MasonInstallAll",
					"MasonInstall",
					"MasonUninstallAll",
					"MasonInstall",
				},
				lazy = true,
				config = function()
					require("plugins.lsp.mason")
				end,
			},
			{
				"williamboman/mason-lspconfig.nvim",
				lazy = true,
				config = function()
					require("mason-lspconfig").setup({
						ensure_installed = { "phpactor", "lua_ls", "pyright", "clangd" },
						automatic_installation = true,
					})
				end,
			},
		},
	},

	{
		"simrat39/rust-tools.nvim",
		lazy = true,
		ft = { "rust" },
		config = function()
			require("rust-tools").setup({
				tools = {
					inlay_hints = {
						auto = false,
					},
					hover_actions = {
						border = "rounded",
					},
					server = {
						capabilities = require("cmp_nvim_lsp").update_capabilities(
							vim.lsp.protocol.make_client_capabilities()
						),
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
							require("plugins.lsp.keymaps").on_attach(client, bufnr)
						end,
					},
				},
			})
		end,
	},
	{
		"ray-x/go.nvim",
		lazy = true,
		ft = { "go", "gomod" },
		build = ":GoInstallBinaries",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem = {
				documentationFormat = { "markdown", "plaintext" },
				snippetSupport = true,
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
			}
			require("go").setup({
				lsp_cfg = {
					on_attach = function(client, bufnr)
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
						require("plugins.lsp.keymaps").on_attach(client, bufnr)
					end,
					capabilities = capabilities,
				},
				lsp_inlay_hints = {
					enable = false,
				},
			})
		end,
	},
}

return {
	{
		"ray-x/navigator.lua",
		branch = "master",
		lazy = true,
		init = function()
			require("setup.lazyload").on_file_open("navigator.lua")
		end,
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
				init = function()
					require("setup.lazyload").on_file_open("nvim-lspconfig")
				end,
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
						capabilities = require("cmp_nvim_lsp").default_capabilities(
							vim.lsp.protocol.make_client_capabilities()
						),
						on_attach = require("setup.utils").on_attach(function(client, buffer)
							require("plugins.lsp.keymaps").on_attach(client, buffer)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end),
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
			require("go").setup({
				lsp_cfg = {
					on_attach = function(client, bufnr)
						require("plugins.lsp.keymaps").on_attach(client, bufnr)
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end,
					capabilities = require("setup.utils").capabilities,
				},
				lsp_inlay_hints = {
					enable = false,
				},
			})
		end,
	},
}

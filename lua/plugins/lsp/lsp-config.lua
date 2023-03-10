return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		require("setup.plugins").on_file_open("nvim-lspconfig")
	end,
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", lazy = true },
		{ "williamboman/mason.nvim", lazy = true },
		{
			"hrsh7th/cmp-nvim-lsp",
			lazy = true,
			cond = function()
				return require("setup.utils").has("nvim-cmp")
			end,
		},
	},

	opts = { setup = {} },
	config = function(_, opts)
		local servers = require("plugins.lsp.config.lsp-server")
		local on_attach = require("setup.utils").on_attach(function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			require("plugins.lsp.config.lsp-keymaps").on_attach(client, bufnr)
		end)
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local function setup(server)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
				on_attach = vim.deepcopy(on_attach),
			}, servers[server] or {})

			if opts.setup[server] then
				if opts.setup[server](server, server_opts) then
					return
				end
			elseif opts.setup["*"] then
				if opts.setup["*"](server, server_opts) then
					return
				end
			end
			require("lspconfig")[server].setup(server_opts)
		end

		local mappings = require("mason-lspconfig.mappings.server")
		if not mappings.lspconfig_to_package.lua_ls then
			mappings.lspconfig_to_package.lua_ls = "lua-language-server"
			mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
		end

		local mlsp = require("mason-lspconfig")
		local available = mlsp.get_available_servers()

		local ensure_installed = {}
		for server, server_opts in pairs(servers) do
			if server_opts then
				server_opts = server_opts == true and {} or server_opts
				if server_opts.mason == false or not vim.tbl_contains(available, server) then
					setup(server)
				else
					ensure_installed[#ensure_installed + 1] = server
				end
			end
		end

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
		})
		require("mason-lspconfig").setup_handlers({ setup })
	end,
}

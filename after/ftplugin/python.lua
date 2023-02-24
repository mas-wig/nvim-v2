local present, nv = pcall(require, "navigator")

if not present then
	return
end

local dirname = function(pathname)
	local path_sep = "/"
	local strip_dir_pat = path_sep .. "([^" .. path_sep .. "]+)$"
	local strip_sep_pat = path_sep .. "$"
	if not pathname or #pathname == 0 then
		return
	end
	local result = pathname:gsub(strip_sep_pat, ""):gsub(strip_dir_pat, "")
	if #result == 0 then
		return "/"
	end
	return result
end

nv.setup({
	lsp = {
		pyright = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
			root_dir = function(fname)
				return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
			end,
			-- on_init = require('navigator.lspclient.python').on_init,
			on_init = function(client)
				require("navigator.lspclient.python").on_init(client)
			end,
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
			settings = {
				python = {
					formatting = { provider = "black" },
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
					},
				},
			},
		},
	},
})

vim.cmd("syntax on")

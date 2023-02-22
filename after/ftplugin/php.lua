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
		phpactor = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
			cmd = { "phpactor", "language-server" },
			filetypes = { "php" },
			root_dir = function(fname)
				return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
			end,
			single_file_support = true,
		},
	},
})

vim.cmd("syntax on")

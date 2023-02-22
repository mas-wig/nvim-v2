local M = {}

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

M.clangd = {
	flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
	end,
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--enable-config",
		"--offset-encoding=utf-16",
		"--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
		"--cross-file-rename",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
}

M.phpactor = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	cmd = { "phpactor", "language-server" },
	filetypes = { "php" },
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
	end,
	single_file_support = true,
}

M.pyright = {
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
}

M.tsserver = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
	end,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	init_options = {
		hostInfo = "neovim",
	},
	single_file_support = true,
}

-- M.lua_ls = {
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- 	single_file_support = true,
-- 	settings = {
-- 		Lua = {
-- 			workspace = {
-- 				checkThirdParty = false,
-- 			},
-- 			completion = {
-- 				workspaceWord = true,
-- 				callSnippet = "Both",
-- 			},
-- 			misc = {
-- 				parameters = {
-- 					"--log-level=trace",
-- 				},
-- 			},
-- 			diagnostics = {
-- 				groupSeverity = {
-- 					strong = "Warning",
-- 					strict = "Warning",
-- 				},
-- 				groupFileStatus = {
-- 					["ambiguity"] = "Opened",
-- 					["await"] = "Opened",
-- 					["codestyle"] = "None",
-- 					["duplicate"] = "Opened",
-- 					["global"] = "Opened",
-- 					["luadoc"] = "Opened",
-- 					["redefined"] = "Opened",
-- 					["strict"] = "Opened",
-- 					["strong"] = "Opened",
-- 					["type-check"] = "Opened",
-- 					["unbalanced"] = "Opened",
-- 					["unused"] = "Opened",
-- 				},
-- 				unusedLocalExclude = { "_*" },
-- 			},
-- 			format = {
-- 				enable = false,
-- 				defaultConfig = {
-- 					indent_style = "space",
-- 					indent_size = "2",
-- 					continuation_indent_size = "2",
-- 				},
-- 			},
-- 		},
-- 	},
-- }

return M

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

return {
	lua_ls = {
		cmd = { "lua-language-server" },
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},

	phpactor = {
		cmd = { "phpactor", "language-server" },
		filetypes = { "php" },
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
		single_file_support = true,
	},

	pyright = {
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
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
		single_file_support = true,
	},

	html = {
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		},
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
		single_file_support = true,
	},

	cssls = {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
		single_file_support = true,
		settings = {
			css = {
				validate = true,
			},
			less = {
				validate = true,
			},
			scss = {
				validate = true,
			},
		},
	},

	sqls = {
		cmd = { "sqls" },
		filetypes = { "sql", "mysql" },
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
		single_file_support = true,
	},
	clangd = {
		flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
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
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
		single_file_support = true,
	},
}

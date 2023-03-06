local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy",
	defaults = {
		lazy = false, -- version = "*" 
	},
	spec = {
		{ import = "plugins.coding" },
		{ import = "plugins.editor" },
		{ import = "plugins.lsp" },
		{ import = "plugins.ui" },
		{ import = "plugins.git" },
		{ import = "plugins.extras" },
		{ import = "plugins.utilities" },
		{ import = "plugins.dap" },
	},
	concurrency = nil,
	install = {
		missing = true,
		colorscheme = { "habamax" },
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
})

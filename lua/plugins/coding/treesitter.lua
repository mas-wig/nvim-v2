local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

local options = {
	ensure_installed = {
		"bash",
		"help",
		"cpp",
		"c",
		"css",
		"dockerfile",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"php",
		"rust",
		"solidity",
		"typescript",
		"vim",
		"yaml",
		"http",
		"markdown",
		"markdown_inline",
		"regex",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	autotag = {
		enable = true,
	},
}

treesitter.setup(options)

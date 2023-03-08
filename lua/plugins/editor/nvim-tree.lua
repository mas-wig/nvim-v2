return {
	"nvim-tree/nvim-tree.lua",
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeClose",
		"NvimTreeFocus",
		"NvimTreeRefresh",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeClipboard",
		"NvimTreeResize",
		"NvimTreeCollapse",
		"NvimTreeCollapseKeepBuffers",
		"NvimTreeGenerateOnAttach",
	},
	keys = {
		{ "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Open NvimTree" },
		{ "<A-p>", "<cmd>NvimTreeFocus<cr>", desc = "Focus NvimTree" },
		{ "<A-f>", "<cmd>NvimTreeFindFile<cr>", desc = "Find File NvimTree" },
	},
	lazy = true,
	config = function()
		return require("nvim-tree").setup({
			sync_root_with_cwd = true,
			view = {
				hide_root_folder = true,
				side = "left",
			},
			renderer = {
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					modified_placement = "after",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						modified = "●",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = " ",
							open = " ",
							empty = " ",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = { ".git", "node_modules", ".gitignore", "alpha", "lazy" },
				exclude = {},
			},
		})
	end,
}

return {
	"tpope/vim-dadbod",
	lazy = true,
	dependencies = { "kristijanhusak/vim-dadbod-ui", lazy = true },
	cmd = {
		"DBUI",
		"DBUIAddConnection",
		"DBUIFindBuffer",
		"DBUILastQueryInfo",
		"DBUIToggle",
		"DBUIRenameBuffer",
	},
}

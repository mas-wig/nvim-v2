return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	init = function()
		require("setup.plugins").on_file_open("nvim-treesitter")
	end,
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
		{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
		{ "windwp/nvim-ts-autotag", lazy = true, config = true },
		{ "RRethy/nvim-treesitter-endwise", lazy = true },
		{ "HiPhish/nvim-ts-rainbow2", lazy = true },
		{ "nvim-treesitter/nvim-treesitter-context", lazy = true, config = true },
		{ "nvim-treesitter/playground", lazy = true },
		{
			"windwp/nvim-autopairs",
			lazy = true,
			opts = {
				close_triple_quotes = true,
				check_ts = true,
				fast_wrap = {
					map = "<c-e>",
				},
			},
		},
		{
			"abecodes/tabout.nvim",
			lazy = true,
			opts = {
				tabkey = "<Tab>",
				backwards_tabkey = "<S-Tab>",
				completion = true,
			},
		},
	},
	config = function()
		return require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			sync_install = false,
			ignore_install = { "phpdoc" },
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			textsubjects = { enable = true, keymaps = { [","] = "textsubjects-smart" } },
			indent = { enable = true },
			autotag = { enable = true },
			endwise = { enable = true },
			context_commentstring = { enable = true },
			rainbow = {
				enable = true,
				disable = { "jsx", "cpp" },
				query = "rainbow-parens",
				strategy = require("ts-rainbow.strategy.global"),
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["il"] = "@loop.inner",
						["al"] = "@loop.outer",
						["icd"] = "@conditional.inner",
						["acd"] = "@conditional.outer",
						["acm"] = "@comment.outer",
						["ast"] = "@statement.outer",
						["isc"] = "@scopename.inner",
						["iB"] = "@block.inner",
						["aB"] = "@block.outer",
						["p"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["gnf"] = "@function.outer",
						["gnif"] = "@function.inner",
						["gnp"] = "@parameter.inner",
						["gnc"] = "@call.outer",
						["gnic"] = "@call.inner",
					},
					goto_next_end = {
						["gnF"] = "@function.outer",
						["gniF"] = "@function.inner",
						["gnP"] = "@parameter.inner",
						["gnC"] = "@call.outer",
						["gniC"] = "@call.inner",
					},
					goto_previous_start = {
						["gpf"] = "@function.outer",
						["gpif"] = "@function.inner",
						["gpp"] = "@parameter.inner",
						["gpc"] = "@call.outer",
						["gpic"] = "@call.inner",
					},
					goto_previous_end = {
						["gpF"] = "@function.outer",
						["gpiF"] = "@function.inner",
						["gpP"] = "@parameter.inner",
						["gpC"] = "@call.outer",
						["gpiC"] = "@call.inner",
					},
				},
			},
		})
	end,
}

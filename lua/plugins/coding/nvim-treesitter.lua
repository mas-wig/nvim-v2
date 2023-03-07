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
				-- syntax-aware textobjects
				enable = true,
				lsp_interop = {
					enable = true,
					peek_definition_code = {
						["DF"] = "@function.outer",
						["Df"] = "@class.outer",
					},
				},
				keymaps = {
					["iL"] = {
						-- you can define your own textobjects directly here
						go = "(function_definition) @function",
					},
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["aC"] = "@class.outer",
					["iC"] = "@class.inner",
					["ac"] = "@conditional.outer",
					["ic"] = "@conditional.inner",
					["ae"] = "@block.outer",
					["ie"] = "@block.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["is"] = "@statement.inner",
					["as"] = "@statement.outer",
					["ad"] = "@comment.outer",
					["am"] = "@call.outer",
					["im"] = "@call.inner",
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				select = {
					enable = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["iF"] = {
							python = "(function_definition) @function",
							cpp = "(function_definition) @function",
							c = "(function_definition) @function",
							java = "(method_declaration) @function",
							go = "(method_declaration) @function",
						},
					},
				},
			},
		})
	end,
}

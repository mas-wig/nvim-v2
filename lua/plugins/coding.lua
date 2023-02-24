return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			{ "saadparwaiz1/cmp_luasnip", lazy = true },
			{ "hrsh7th/cmp-nvim-lua", lazy = true },
			{ "hrsh7th/cmp-nvim-lsp", lazy = true },
			{ "hrsh7th/cmp-buffer", lazy = true },
			{ "hrsh7th/cmp-path", lazy = true },
			{
				"tzachar/cmp-tabnine",
				lazy = true,
				build = "./install.sh",
				config = function()
					require("plugins.coding.cmp").tabnine()
				end,
			},
		},
		config = function()
			require("plugins.coding.cmp").cmpconfig()
		end,
	},

	{
		"CRAG666/code_runner.nvim",
		lazy = true,
		keys = {
			{ "<leader>rc", "<cmd>RunCode<cr>", desc = "Run Code" },
			{ "<leader>rx", "<cmd>RunClose<cr>", desc = "Run CLose" },
		},
		cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },
		config = function()
			require("code_runner").setup({
				mode = "term",
				focus = false,
				startinsert = true,
				term = {
					position = "vert",
					size = 60,
				},
				filetype_path = vim.fn.expand("~/.config/nvim/after/code_runner.json"),
				-- project_path = vim.fn.expand("~/.config/nvim/project_manager.json"),
			})
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		lazy = true,
		config = function()
			require("plugins.coding.cmp").luasnip()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
		lazy = true,
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugins.coding.treesitter")
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		lazy = true,
		cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
		config = function()
			require("plugins.coding.chatgpt")
		end,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "Trouble" },
		keys = require("plugins.coding.trouble").keymaps(),
		config = function()
			require("plugins.coding.trouble").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.coding.gitsign")
		end,
	},

	{
		"rest-nvim/rest.nvim",
		lazy = true,
		cmd = { "RestNvim", "RestNvimPreview", "RestNvimLast" },
		ft = "http",
		config = function()
			require("plugins.coding.rest")
		end,
	},

	{
		"pwntester/octo.nvim",
		lazy = true,
		cmd = { "Octo" },
		config = function()
			require("plugins.coding.octo")
		end,
	},

	---- END MAIN ----

	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		lazy = true,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				lazy = true,
				init = function()
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end,
			},
		},
		config = function()
			require("plugins.coding.miniai").setup()
		end,
	},

	{ "windwp/nvim-ts-autotag", ft = { "html", "jsx", "tsx", "vue" }, lazy = true },

	{ "p00f/nvim-ts-rainbow", event = "BufRead" },

	{
		"windwp/nvim-autopairs",
		event = "BufRead",
		lazy = true,
		config = function()
			local _, autopairs = pcall(require, "nvim-autopairs")
			local _, cmp = pcall(require, "cmp")
			autopairs.setup({
				fast_wrap = {
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
				disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
			})
			local _, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"chrisbra/csv.vim",
		ft = "csv",
		config = function()
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = { "*.csv", "*.dat" },
				command = "setfiletype csv",
				group = vim.api.nvim_create_augroup("filetypedetect", { clear = true }),
			})
		end,
	},

	{
		"tpope/vim-dadbod",
		lazy = true,
		dependencies = { "kristijanhusak/vim-dadbod-ui" },
		cmd = {
			"DBUI",
			"DBUIAddConnection",
			"DBUIFindBuffer",
			"DBUILastQueryInfo",
			"DBUIToggle",
			"DBUIRenameBuffer",
		},
	},
	{
		"echasnovski/mini.surround",
		lazy = true,
		keys = function(_, keys)
			local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
			local opts = require("lazy.core.plugin").values(plugin, "opts", false)
			local mappings = {
				{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
				{ opts.mappings.delete, desc = "Delete surrounding" },
				{ opts.mappings.find, desc = "Find right surrounding" },
				{ opts.mappings.find_left, desc = "Find left surrounding" },
				{ opts.mappings.highlight, desc = "Highlight surrounding" },
				{ opts.mappings.replace, desc = "Replace surrounding" },
				{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
			}
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "gza",
				delete = "gzd",
				find = "gzf",
				find_left = "gzF",
				highlight = "gzh",
				replace = "gzr",
				update_n_lines = "gzn",
			},
		},
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},
}

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = function()
		local key_telescope = require("setup.utils").key_telescope
		return {
			{
				"<leader>,",
				"<cmd>Telescope buffers show_all_buffers=true<cr>",
				desc = "Tel Switch Buffer",
			},
			{
				"<leader>/",
				key_telescope("live_grep"),
				desc = "Tel Find in Files (Grep)",
			},
			{
				"<leader>:",
				"<cmd>Telescope command_history<cr>",
				desc = "Tel Command History",
			},
			{
				"<leader><space>",
				key_telescope("files"),
				desc = "Tel Find Files (root dir)",
			}, -- find
			{
				"<leader>fb",
				"<cmd>Telescope buffers<cr>",
				desc = "Tel Buffers",
			},
			{
				"<leader>fF",
				key_telescope("files"),
				desc = "Tel Find Files (root dir)",
			},
			{
				"<leader>ff",
				key_telescope("files", {
					cwd = false,
				}),
				desc = "Tel Find Files (cwd)",
			},
			{
				"<leader>fr",
				"<cmd>Telescope oldfiles<cr>",
				desc = "Tel Recent",
			}, -- git
			{
				"<leader>gc",
				"<cmd>Telescope git_commits<CR>",
				{ desc = "Tel git commits" },
			},
			{
				"<leader>gs",
				"<cmd>Telescope git_status<CR>",
				desc = "Tel git status",
			}, -- search
			{
				"<leader>sa",
				"<cmd>Telescope autocommands<cr>",
				desc = "Tel Auto Commands",
			},
			{
				"<leader>sb",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Tel Buffer",
			},
			{
				"<leader>sc",
				"<cmd>Telescope command_history<cr>",
				desc = "Tel Command History",
			},
			{
				"<leader>sC",
				"<cmd>Telescope commands<cr>",
				desc = "Tel Commands",
			},
			{
				"<leader>sd",
				"<cmd>Telescope diagnostics<cr>",
				desc = "Tel Diagnostics",
			},
			{
				"<leader>sg",
				key_telescope("live_grep"),
				desc = "Tel Grep (root dir)",
			},
			{
				"<leader>sG",
				key_telescope("live_grep", {
					cwd = false,
				}),
				desc = "Tel Grep (cwd)",
			},
			{
				"<leader>sh",
				"<cmd>Telescope help_tags<cr>",
				desc = "Tel Help Pages",
			},
			{
				"<leader>sH",
				"<cmd>Telescope highlights<cr>",
				desc = "Search Highlight Groups",
			},
			{
				"<leader>sk",
				"<cmd>Telescope keymaps<cr>",
				desc = "Tel Key Maps",
			},
			{
				"<leader>sM",
				"<cmd>Telescope man_pages<cr>",
				desc = "Tel Man Pages",
			},
			{
				"<leader>sm",
				"<cmd>Telescope marks<cr>",
				desc = "Tel Jump to Mark",
			},
			{
				"<leader>so",
				"<cmd>Telescope vim_options<cr>",
				desc = "Tel Options",
			},
			{
				"<leader>sw",
				key_telescope("grep_string"),
				desc = "Tel Word (root dir)",
			},
			{
				"<leader>sW",
				key_telescope("grep_string", {
					cwd = false,
				}),
				desc = "Tel Word (cwd)",
			},
			{
				"<leader>uC",
				key_telescope("colorscheme", {
					enable_preview = true,
				}),
				desc = "Tel Colorscheme with preview",
			},
			{
				"<leader>ss",
				key_telescope("lsp_document_symbols", {
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
				}),
				desc = " Tel Goto Symbol",
			},
		}
	end,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", lazy = true, build = "make" },
		{ "nvim-telescope/telescope-media-files.nvim", lazy = true },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = " 🔎 ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = {
					"node_modules",
					"assets",
					".git",
					"^target",
					"%.aux",
					"%.toc",
					"%.pdf",
					"%.out",
					"%.log",
					".repro/*",
					".DS_Store",
				},
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				set_env = {
					["COLORTERM"] = "truecolor",
				}, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = { n = { ["q"] = require("telescope.actions").close } },
			},
			extensions = {
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "mkv", "pdf", "gif", "ico", "svg" },
					find_cmd = "rg",
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("media_files")
	end,
}

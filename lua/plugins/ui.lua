return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		event = "VimEnter",
		config = function()
			require("plugins.ui.tokyonight")
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "tiagovla/scope.nvim", lazy = true },
		lazy = true,
		event = "VimEnter",
		config = function()
			require("plugins.ui.bufferline")
		end,
	},

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.ui.alpha").setup()
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		lazy = true,
		keys = require("plugins.ui.noice").keymaps,
		config = function()
			require("plugins.ui.noice").setup()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("plugins.ui.lualine").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			local Util = require("setup.utils")
			if not Util.has("noice.nvim") then
				Util.on_very_lazy(function()
					vim.notify = require("notify")
				end)
			end
		end,
	},

	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("indent_blankline").setup({
				char = "│",
				filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "dbui" },
				show_trailing_blankline_indent = false,
				show_current_context = false,
				show_current_context_start = false,
			})
		end,
	},

	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason", "dbui" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},

	{
		"linrongbin16/lsp-progress.nvim",
		event = { "VimEnter" },
		lazy = true,
		config = function()
			require("lsp-progress").setup({
				spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
				event_update_time_limit = 200,
				client_format = function(_, spinner, series_messages)
					return #series_messages > 0 and (spinner .. " " .. table.concat(series_messages, ", ")) or nil
				end,
				format = function(client_messages)
					if rawget(vim, "lsp") then
						for _, client in ipairs(vim.lsp.get_active_clients()) do
							if client.attached_buffers[vim.api.nvim_get_current_buf()] then
								return #client_messages > 0 and (" " .. table.concat(client_messages, " "))
									or client.name .. " 🪷"
							end
						end
					end
				end,
			})
		end,
	},
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	lazy = true,

	config = function()
		local colors = require("helper.colors")

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local configs = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.lualine_fg, bg = colors.lualine_bg } },
					inactive = { c = { fg = colors.lualine_fg, bg = colors.lualine_bg } },
				},
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			winbar = {
				lualine_a = {},
			},
		}

		local function ins_winbar_left(component)
			table.insert(configs.winbar.lualine_a, component)
		end

		local function ins_left(component)
			table.insert(configs.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(configs.sections.lualine_x, component)
		end

		ins_winbar_left({
			function()
				return require("nvim-navic").get_location()
			end,
			cond = function()
				return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
			end,
		})

		ins_left({
			"mode",
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			icons_enabled = true,
		})

		ins_left({
			"branch",
			icon = "",
			color = { fg = colors.green, gui = "bold" },
		})

		ins_left({
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
		})

		ins_right({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				color_error = { fg = colors.red },
				color_warn = { fg = colors.yellow },
				color_info = { fg = colors.cyan },
			},
		})

		ins_right({
			require("lsp-progress").progress,
			color = { fg = "#ffff33" },
		})

		ins_right({ "progress", color = { fg = colors.lualine_fg, gui = "bold" } })

		require("lualine").setup(configs)
	end,
}

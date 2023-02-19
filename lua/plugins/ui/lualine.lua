local M = {}

M.setup = function()
	local present, lualine = pcall(require, "lualine")

	if not present then
		return
	end

	local colors = {
		red = "#ca1243",
		white = "#f3f3f3",
		green = "#8ec07c",
		sep = "#1a1b26",
		blue = "#0099ff",
		yellow = "#ffff4d",
	}

	local empty = require("lualine.component"):extend()
	function empty:draw(default_highlight)
		self.status = ""
		self.applied_separator = ""
		self:apply_highlights(default_highlight)
		self:apply_section_separators()
		return self.status
	end

	local function process_sections(sections)
		for name, section in pairs(sections) do
			local left = name:sub(9, 10) < "x"

			for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
				table.insert(section, pos * 2, { empty, color = { fg = colors.sep, bg = colors.sep } })
			end

			for id, comp in ipairs(section) do
				if type(comp) ~= "table" then
					comp = { comp }
					section[id] = comp
				end
				comp.separator = left and { right = "" } or { left = "" }
			end
		end
		return sections
	end

	return lualine.setup({
		options = {
			icons_enabled = true,
			theme = "dracula",
			component_separators = "",
			section_separators = "",
			disabled_filetypes = {
				"packer",
				"NvimTree",
				"toggleterm",
			},
			always_divide_middle = true,
			ignore_focus = { "terminal" },
		},
		sections = process_sections({
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				{
					"diff",
					diff_color = {
						added = { fg = "#1aff1a" },
						modified = { fg = "#e6e600" },
						removed = { fg = "#ff4d4d" },
					},
					symbols = { added = "🟢 ", modified = " 🟡 ", removed = " 🔴 " },
				},
			},
			lualine_c = {
				{ "filename" },
				{ "filetype" },
			},
			lualine_x = {
				{
					"diagnostics",
					source = { "nvim_diagnostic" },
					sections = { "error" },
					symbols = { error = " " },
					update_in_insert = true,
					diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
				},
				{
					"diagnostics",
					source = { "nvim_diagnostic" },
					sections = { "warn" },
					symbols = { warn = " " },
					update_in_insert = true,
					diagnostics_color = { warn = { bg = colors.yellow, fg = "#000000" } },
				},
				{
					"diagnostics",
					source = { "nvim_diagnostic" },
					sections = { "info" },
					symbols = { info = " " },
					update_in_insert = true,
					diagnostics_color = { warn = { bg = colors.blue, fg = "#000000" } },
				},
				{
					"diagnostics",
					source = { "nvim_diagnostic" },
					sections = { "hint" },
					symbols = { hint = " " },
					update_in_insert = true,
					diagnostics_color = { warn = { bg = colors.green, fg = "#000000" } },
				},
				{ require("lsp-progress").progress, color = { fg = "#ffff33" } },
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		}),
	})
end

return M

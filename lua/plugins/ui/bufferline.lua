local present, bufferline = pcall(require, "bufferline")

if not present then
	return
end

return bufferline.setup({
	highlights = {
		modified_selected = {
			bg = "#44475a",
		},
		close_button_selected = {
			fg = "#ff3333",
			bg = "#44475a",
		},
		buffer_selected = {
			fg = "#4dffdb",
			bg = "#44475a",
			bold = false,
			italic = false,
		},
	},

	options = {
		mode = "tabs",
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 17,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = true,
		show_tab_indicators = false,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		separator_style = "thick",
		enforce_regular_tabs = false,
		always_show_bufferline = false,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "insert_after_current",
	},
})

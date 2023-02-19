local present, octo = pcall(require, "octo")

if not present then
	return
end

return octo.setup({
	default_remote = { "upstream", "origin" },
	reaction_viewer_hint_icon = "",
	-- ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"]
	user_icon = " ",
	timeline_marker = "",
	timeline_indent = "2",
	right_bubble_delimiter = "",
	left_bubble_delimiter = "",
	github_hostname = "", -- GitHub Enterprise host
	snippet_context_lines = 4, -- number or lines around commented lines
	ui = {
		use_signcolumn = true,
	},
	issues = {
		order_by = { field = "CREATED_AT", direction = "DESC" },
	},
	pull_requests = {
		order_by = { field = "CREATED_AT", direction = "DESC" },
		always_select_remote_on_create = "false",
	},
	file_panel = {
		size = 10,
		use_icons = true,
	},
})

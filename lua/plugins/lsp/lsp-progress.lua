return {
	"linrongbin16/lsp-progress.nvim",
	event = { "BufAdd", "TabEnter" },
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
							if client.name == "phpactor" then
								return client.name .. " 🪷"
							else
								return #client_messages > 0 and (" " .. table.concat(client_messages, " "))
									or client.name .. " 🪷"
							end
						end
					end
				end
			end,
		})
	end,
}

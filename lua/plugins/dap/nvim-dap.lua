return {
	"mfussenegger/nvim-dap",
	lazy = true,
	keys = require("plugins.dap.config.dap-keymaps"),
	dependencies = {
		{ "theHamsta/nvim-dap-virtual-text", lazy = true },
		{
			"rcarriga/nvim-dap-ui",
			lazy = true,
			config = function()
				local _, dap = pcall(require, "dap")
				local _, dap_ui = pcall(require, "dapui")

				dap_ui.setup({
					icons = { expanded = "🔻", collapsed = "🔺" },
					mappings = {
						expand = { "<CR>", "<2-LeftMouse>" },
						open = "o",
						remove = "d",
						edit = "e",
						repl = "r",
						toggle = "t",
					},
					floating = {
						max_height = nil, -- These can be integers or a float between 0 and 1.
						max_width = nil, -- Floats will be treated as percentage of your screen.
						border = "rounded", -- Border style. Can be "single", "double" or "rounded"
						mappings = {
							close = { "q", "<Esc>" },
						},
					},
					layouts = {
						{
							elements = {
								-- {id = "watches", size = 0.20},
								{ id = "stacks", size = 0.30 },
								{ id = "breakpoints", size = 0.30 },
								{ id = "scopes", size = 0.30 },
							},
							size = 64,
							position = "right",
						},
						{
							elements = {
								-- "repl",
								"console",
								"watches",
							},
							size = 0.30,
							position = "bottom",
						},
					},
				})

				dap.listeners.after.event_initialized["dapui_config"] = function()
					dap_ui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dap_ui.close()
					dap.repl.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dap_ui.close()
					dap.repl.close()
				end
			end,
		},
	},
	config = function()
		local present, dap = pcall(require, "dap")

		if not present then
			return
		end

		local dap_breakpoint = {
			error = {
				text = "🟥",
				texthl = "LspDiagnosticsSignError",
				linehl = "",
				numhl = "",
			},
			rejected = {
				text = "🟩",
				texthl = "LspDiagnosticsSignHint",
				linehl = "",
				numhl = "",
			},
			stopped = {
				text = "🟨",
				texthl = "LspDiagnosticsSignInformation",
				linehl = "DiagnosticUnderlineInfo",
				numhl = "LspDiagnosticsSignInformation",
			},
		}

		vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
		vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
		vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

		local dap_configs = { go = require("plugins.dap.config.dap-go").go() }

		for dap_name, dap_options in pairs(dap_configs) do
			dap.adapters[dap_name] = dap_options.adapters
			dap.configurations[dap_name] = dap_options.configurations
		end
	end,
}

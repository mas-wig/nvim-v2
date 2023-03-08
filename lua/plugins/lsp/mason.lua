return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstallAll", "MasonUninstallAll", "MasonInstall", "MasonUninstall" },
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"lua-language-server",
				"shfmt",
				"flake8",
			},
		},
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})
		end,
	},
}

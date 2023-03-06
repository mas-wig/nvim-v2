return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = "InsertEnter",
	dependencies = {
		{ "saadparwaiz1/cmp_luasnip", lazy = true },
		{ "hrsh7th/cmp-nvim-lua", lazy = true },
		{ "hrsh7th/cmp-nvim-lsp", lazy = true },
		{ "hrsh7th/cmp-buffer", lazy = true },
		{ "hrsh7th/cmp-path", lazy = true },
		{ "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
		{ "petertriho/cmp-git", lazy = true, config = true },
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets", lazy = true },
			lazy = true,
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = vim.g.luasnippets_path or "",
				})

				vim.api.nvim_create_autocmd("InsertLeave", {
					callback = function()
						if
							require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
							and not require("luasnip").session.jump_active
						then
							require("luasnip").unlink_current()
						end
					end,
				})
			end,
		},
	},
	config = function()
		local ok, cmp = pcall(require, "cmp")

		if not ok then
			return
		end

		return cmp.setup({
			preselect = cmp.PreselectMode.None,
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "git" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			}),
			completion = { completeopt = "menu,menuone,noinsert" },
			window = {
				completion = {
					scrollbar = false,
					border = "single",
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
					side_padding = 1,
				},
				documentation = { border = "single" },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			formatting = {
				format = function(entry, vim_item)
					local cmp_kinds = require("helper.icons").cmp
					local source = entry.source.name
					if source == "luasnip" or source == "nvim_lsp" then
						vim_item.dup = 0
						vim_item.kind = cmp_kinds[vim_item.kind] .. vim_item.kind
					end
					return vim_item
				end,
			},
			experimental = { ghost_text = true },
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
					else
						fallback()
					end
				end, { "i", "s" }),
			},
		})
	end,
}

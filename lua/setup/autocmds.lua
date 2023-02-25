local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- fold
vim.cmd([[
    augroup remember_folds
        autocmd!
        autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
        autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
    augroup END
    ]])


autocmd("BufWinEnter",{
    group = augroup("uncomment_newline"),
    pattern = "*.*",
    command = "set formatoptions-=cro"
})

-- Reload file
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- exclude qf buffer
autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

-- Format on save
autocmd("BufWritePost", {
	pattern = "*",
	command = "FormatWrite",
	group = augroup("FormatAutogroup"),
})

-- refresh lsp-progress
autocmd("User", {
	pattern = "LspProgressStatusUpdated",
	command = "lua require('lualine').refresh()",
	group = augroup("lualine_augroup"),
})

local exclude_ft = {
	"lazy",
	"NvimTree",
	"toggleterm",
	"alpha",
	"crunner_main",
	"terminal",
	"help",
	"dashboard",
	"Trouble",
	"octo",
	"mason",
	"dbui",
	"TelescopePromt",
	"chatgpt",
	"Telescope",
}

autocmd("FileType", {
	pattern = exclude_ft,
	callback = function()
		if vim.bo.ft == exclude_ft then
			vim.opt.laststatus = 0
			require("indent_blankline").setup({
				filetype_exclude = exclude_ft,
			})
		end
		vim.b.miniindentscope_disable = true
	end,
})

-- uncomment new lines
autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

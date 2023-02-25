local autocmd = vim.api.nvim_create_autocmd

local groups = function(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

autocmd("VimEnter", {
	pattern = "*.*",
	group = groups("reload_buf"),
	command = "bufdo! e",
})

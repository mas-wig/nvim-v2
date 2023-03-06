return {
	"chrisbra/csv.vim",
	ft = "csv",
	config = function()
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = { "*.csv", "*.dat" },
			command = "setfiletype csv",
			group = vim.api.nvim_create_augroup("filetypedetect", { clear = true }),
		})
	end,
}

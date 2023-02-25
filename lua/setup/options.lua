local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
g.codeium_disable_bindings = 1

opt.autowrite = true

-- sync os clipboard
opt.clipboard = "unnamedplus"

-- sembuyikan markup *
opt.conceallevel = 2
opt.concealcursor = "n"

opt.confirm = true
opt.cursorline = true
opt.expandtab = true

opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.hidden = true
opt.ignorecase = true
opt.inccommand = "split"
opt.joinspaces = false
opt.list = true

-- mouse
opt.mouse = "a"

-- plumb
opt.pumblend = 5
opt.pumheight = 10

-- line number
opt.number = true
opt.relativenumber = true

-- indent
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.sidescrolloff = 8
opt.smartindent = true

opt.showmode = false

opt.signcolumn = "yes"
opt.smartcase = true

-- split window
opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true

-- undo
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200

-- cmp command mode
opt.wildmode = "longest:full,full"

opt.wrap = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.ruler = true

-- fold
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}

-- default provider
for _, provider in ipairs(default_providers) do
	g["loaded_" .. provider .. "_provider"] = 0
end

-- indent blankline
g.indent_blankline_use_treesitter = true
g.indent_blankline_indent_level = 4
g.indent_blankline_show_end_of_line = true

-- dbui
g.db_ui_use_nerd_fonts = 1
g.db_ui_save_location = "~/.config/nvim/lua/others"

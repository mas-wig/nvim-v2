local g = vim.g
local opt = vim.opt
local bo = vim.bo
local wo = vim.wo

-- g.do_filetype_lua = 1
-- g.did_load_filetypes = 0

g.nojoinspaces = true

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_python_provier = 0
g.loaded_python3_provider = 0
g.python_host_skip_check = 1
g.python_host_prog = "/bin/python2"
g.python3_host_skip_check = 1
g.python3_host_prog = "/bin/python3"

g.matchparen_timeout = 20
g.matchparen_insert_timeout = 20

g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_matchit = 1
g.loaded_netrw = 1
g.loaded_netrwFileHandlers = 1
g.loaded_loaded_remote_plugins = 1
g.loaded_loaded_tutor_mode_plugin = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_matchparen = 1

g.mapleader = " "
g.maplocalleader = " "

if vim.fn.has("patch-8.1.1366") then
	opt.modelines = 5
	opt.modelineexpr = false
	opt.modeline = true
else
	opt.modeline = false
end

opt.clipboard = "unnamedplus"
opt.ssop = opt.ssop - { "blank", "help", "buffers" } + { "terminal" }
opt.emoji = false
opt.undofile = true
opt.shada = "!,'30,<30,s30,h,:30,%0,/30"
opt.whichwrap = opt.whichwrap:append("<>[]hl")
opt.iskeyword = opt.iskeyword:append("-")
opt.listchars = {
	eol = " ",
	tab = "▶ ",
	trail = "•",
	precedes = "«",
	extends = "»",
	nbsp = "␣",
	space = ".",
}
opt.completeopt = { "menuone", "noselect" }
opt.encoding = "utf-8"
opt.fileencoding = "utf8"
opt.syntax = "ON"
opt.foldenable = false
opt.foldopen = opt.foldopen + "jump"
opt.foldmethod = "indent"
opt.wildignore = {
	".git",
	".hg",
	".svn",
	"*.pyc",
	"*.o",
	"*.out",
	"*.jpg",
	"*.jpeg",
	"*.png",
	"*.gif",
	"*.zip",
	"**/node_modules/**",
	"**/bower_modules/**",
	"__pycache__",
	"*~",
	"*.DS_Store",
	"**/undo/**",
	"*[Cc]ache/",
}
opt.pyxversion = 3
opt.wildignorecase = true
opt.infercase = true
opt.lazyredraw = false -- kalo lu nggak mau confic sama noice
opt.showmatch = true
opt.matchtime = 2
opt.synmaxcol = 128
opt.shell = "/bin/zsh"
opt.pumheight = 10
opt.pumblend = 15
opt.wildmode = "longest:full,full"
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.incsearch = true
opt.joinspaces = false
opt.linebreak = true
opt.list = true
opt.relativenumber = true
opt.scrolloff = 2
opt.shiftround = true
opt.shiftwidth = 4
opt.expandtab = true
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes:1"
opt.smartcase = true
opt.smartindent = true
opt.spelllang = { "en_gb" }
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.wrap = true
opt.mouse = "a"
opt.undodir = "/tmp"
opt.undofile = true
opt.fillchars = {
	eob = "~",
}

if vim.fn.executable("rg") then
	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
	opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

if vim.fn.executable("prettier") then
	opt.formatprg = "prettier --stdin-filepath=%"
end

opt.formatoptions = "l"
opt.formatoptions = opt.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2"

opt.guicursor = {
	"n-v:block",
	"i-c-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}

wo.numberwidth = 2
wo.number = true
wo.relativenumber = true
wo.linebreak = true
wo.cursorline = true
wo.foldenable = false

bo.expandtab = true
bo.softtabstop = 4
bo.tabstop = 4
bo.shiftwidth = 4
bo.smartindent = true
bo.suffixesadd = ".lua"

---
g.db_ui_use_nerd_fonts = 1

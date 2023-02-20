local indent = 4
local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

opt.autowrite = true -- enable auto write
opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.conceallevel = 2 -- Hide * markup for bold and italic
opt.concealcursor = "n" -- Hide * markup for bold and italic
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
-- opt.foldexpr = "nvim_treesitter#foldexpr()" -- TreeSitter folding
-- opt.foldlevel = 6
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.hidden = true -- Enable modified buffers in background
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- preview incremental substitute
opt.joinspaces = false -- No double spaces with join after a dot
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 5 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = indent -- Size of an indent
opt.tabstop = indent -- Number of spaces tabs count for
opt.showmode = false -- dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true -- True color support
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = true -- Disable line wrap
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

g.indent_blankline_use_treesitter = true
g.indent_blankline_indent_level = 4
g.indent_blankline_show_end_of_line = true

g.db_ui_use_nerd_fonts = 1
g.navic_silence = true
g.db_ui_save_location = "~/.config/nvim/db"

vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- opt.statuscolumn =
-- 	'%=%l%s%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "⏵") : " " }'

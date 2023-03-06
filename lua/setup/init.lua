local path = vim.fn.stdpath("config") .. "/lua/setup"
local loaded_files = {}

-- Load options.lua
local options = require("setup.options")
loaded_files["options"] = options

-- Load lazy.lua
local lazy = require("setup.lazy")
loaded_files["lazy"] = lazy

-- Load mapping.lua
local mappings = require("setup.mappings")
loaded_files["mappings"] = mappings

-- Load autocmd.lua
local autocmds = require("setup.autocmds")
loaded_files["autocmds"] = autocmds

-- Return the loaded modules
return setmetatable({}, {
	__index = function(_, k)
		return loaded_files[k] or require(path .. "." .. k)
	end,
})

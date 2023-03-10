local colors = require("tokyonight.colors")
local config = require("tokyonight.config")
local options = config.options
local theme = {
	config = options,
	colors = colors.setup(),
}
local c = theme.colors

return {
	{ "LineNr", { fg = "#ffffff" } },

	{ "TelescopeBorder", { fg = "#c4ff4d", bg = "#222436" } },
	{ "TelescopeNormal", { bg = "#222436" } },
	{ "TelescopePromptTitle", { bg = "#ff4d4d", fg = "#000000" } },
	{ "TelescopePreviewTitle", { bg = "#79ff4d", fg = "#000000" } },
	{ "TelescopeResultsTitle", { bg = "#66ffcc", fg = "#000000" } },

	{ "NvimTreeIndentMarker", { fg = "#1affd1", bg = "#222436" } },
	{ "NvimTreeWinSeparator", { fg = "#ffff4d", bg = "#222436" } },
	{ "NvimTreeFolderIcon", { fg = "#e6b800", bg = "#222436" } },
	{ "NvimTreeGitDeleted", { fg = "#ff4d4d" } },
	{ "NvimTreeNormal", { bg = "#222436" } },

	{ "WinSeparator", { fg = "#ffff4d", bg = "#222436" } },

	{ "WhichKey", { fg = "#ff00ff", bg = "#222436" } },
	{ "WhichKeyBorder", { fg = "#ace600", bg = "#222436" } },
	{ "WhichKeyFloat", { bg = "#222436" } },

	{ "WildMenu", { fg = "#bf40bf", bg = "#222436" } },

	{ "NoiceCmdlinePrompt", fg = "none", bg = "#bfff80" },
	{ "NoiceCmdlinePopupBorder", { fg = "#b84dff", bg = "#222436" } },

	{ "NavicIconsFile", { bg = "#222436" } },
	{ "NavicIconsModule", { bg = "#222436" } },
	{ "NavicIconsNamespace", { bg = "#222436" } },
	{ "NavicIconsPackage", { bg = "#222436" } },
	{ "NavicIconsClass", { bg = "#222436" } },
	{ "NavicIconsMethod", { bg = "#222436" } },
	{ "NavicIconsProperty", { bg = "#222436" } },
	{ "NavicIconsField", { bg = "#222436" } },
	{ "NavicIconsConstructor", { bg = "#222436" } },
	{ "NavicIconsEnum", { bg = "#222436" } },
	{ "NavicIconsInterface", { bg = "#222436" } },
	{ "NavicIconsFunction", { bg = "#222436" } },
	{ "NavicIconsVariable", { bg = "#222436" } },
	{ "NavicIconsConstant", { bg = "#222436" } },
	{ "NavicIconsString", { bg = "#222436" } },
	{ "NavicIconsNumber", { bg = "#222436" } },
	{ "NavicIconsBoolean", { bg = "#222436" } },
	{ "NavicIconsArray", { bg = "#222436" } },
	{ "NavicIconsObject", { bg = "#222436" } },
	{ "NavicIconsKey", { bg = "#222436" } },
	{ "NavicIconsNull", { bg = "#222436" } },
	{ "NavicIconsEnumMember", { bg = "#222436" } },
	{ "NavicIconsStruct", { bg = "#222436" } },
	{ "NavicIconsEvent", { bg = "#222436" } },
	{ "NavicIconsOperator", { bg = "#222436" } },
	{ "NavicIconsTypeParameter", { bg = "#222436" } },
	{ "NavicText", { bg = "#222436", fg = "#b3ff1a" } },
	{ "NavicSeparator", { bg = "#222436", fg = "#ff66ff" } },

	{ "GitSignsAdd", { fg = "#00e6ac", bg = "#222436" } },
	{ "GitSignsChange", { fg = "#ffff00", bg = "#222436" } },
	{ "GitSignsDelte", { fg = "#ff0000", bg = "#222436" } },

	{ "TreesitterContext", { bg = "#222436" } },

	{ "DiagnosticVirtualTextError", { bg = "#222436", fg = c.error } },
	{ "DiagnosticVirtualTextWarn", { bg = "#222436", fg = c.warning } },
	{ "DiagnosticVirtualTextInfo", { bg = "#222436", fg = c.info } },
	{ "DiagnosticVirtualTextHint", { bg = "#222436", fg = c.hint } },

	{ "PmenuSel", { bg = "#8f00b3" } },
}

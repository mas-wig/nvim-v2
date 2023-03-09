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

	{ "TelescopeBorder", { fg = "#c4ff4d", bg = "none" } },
	{ "TelescopeNormal", { bg = "none" } },
	{ "TelescopePromptTitle", { bg = "#ff4d4d", fg = "#000000" } },
	{ "TelescopePreviewTitle", { bg = "#79ff4d", fg = "#000000" } },
	{ "TelescopeResultsTitle", { bg = "#66ffcc", fg = "#000000" } },

	{ "NvimTreeIndentMarker", { fg = "#1affd1", bg = "none" } },
	{ "NvimTreeWinSeparator", { fg = "#ffff4d", bg = "none" } },
	{ "NvimTreeFolderIcon", { fg = "#e6b800", bg = "none" } },
	{ "NvimTreeGitDeleted", { fg = "#ff4d4d" } },
	{ "NvimTreeNormal", { bg = "none" } },

	{ "WinSeparator", { fg = "#ffff4d", bg = "none" } },

	{ "WhichKey", { fg = "#ff00ff", bg = "none" } },
	{ "WhichKeyBorder", { fg = "#ace600", bg = "none" } },
	{ "WhichKeyFloat", { bg = "none" } },

	{ "WildMenu", { fg = "#bf40bf", bg = "none" } },

	{ "NoiceCmdlinePrompt", fg = "none", bg = "#bfff80" },
	{ "NoiceCmdlinePopupBorder", { fg = "#b84dff", bg = "none" } },

	{ "NavicIconsFile", { bg = "#1a1b26" } },
	{ "NavicIconsModule", { bg = "#1a1b26" } },
	{ "NavicIconsNamespace", { bg = "#1a1b26" } },
	{ "NavicIconsPackage", { bg = "#1a1b26" } },
	{ "NavicIconsClass", { bg = "#1a1b26" } },
	{ "NavicIconsMethod", { bg = "#1a1b26" } },
	{ "NavicIconsProperty", { bg = "#1a1b26" } },
	{ "NavicIconsField", { bg = "#1a1b26" } },
	{ "NavicIconsConstructor", { bg = "#1a1b26" } },
	{ "NavicIconsEnum", { bg = "#1a1b26" } },
	{ "NavicIconsInterface", { bg = "#1a1b26" } },
	{ "NavicIconsFunction", { bg = "#1a1b26" } },
	{ "NavicIconsVariable", { bg = "#1a1b26" } },
	{ "NavicIconsConstant", { bg = "#1a1b26" } },
	{ "NavicIconsString", { bg = "#1a1b26" } },
	{ "NavicIconsNumber", { bg = "#1a1b26" } },
	{ "NavicIconsBoolean", { bg = "#1a1b26" } },
	{ "NavicIconsArray", { bg = "#1a1b26" } },
	{ "NavicIconsObject", { bg = "#1a1b26" } },
	{ "NavicIconsKey", { bg = "#1a1b26" } },
	{ "NavicIconsNull", { bg = "#1a1b26" } },
	{ "NavicIconsEnumMember", { bg = "#1a1b26" } },
	{ "NavicIconsStruct", { bg = "#1a1b26" } },
	{ "NavicIconsEvent", { bg = "#1a1b26" } },
	{ "NavicIconsOperator", { bg = "#1a1b26" } },
	{ "NavicIconsTypeParameter", { bg = "#1a1b26" } },
	{ "NavicText", { bg = "#1a1b26", fg = "#b3ff1a" } },
	{ "NavicSeparator", { bg = "#1a1b26", fg = "#ff1a1a" } },

	{ "GitSignsAdd", { fg = "#00e6ac", bg = "none" } },
	{ "GitSignsChange", { fg = "#ffff00", bg = "none" } },
	{ "GitSignsDelte", { fg = "#ff0000", bg = "#1a1b26" } },

	{ "TreesitterContext", { bg = "#1a1b26" } },

	{ "DiagnosticVirtualTextError", { bg = "none", fg = c.error } },
	{ "DiagnosticVirtualTextWarn", { bg = "none", fg = c.warning } },
	{ "DiagnosticVirtualTextInfo", { bg = "none", fg = c.info } },
	{ "DiagnosticVirtualTextHint", { bg = "none", fg = c.hint } },

	{ "PmenuSel", { bg = "#8f00b3" } },
}

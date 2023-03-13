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

	{ "CursorLine", { bg = "none" } },

	{ "TelescopeBorder", { fg = "#c4ff4d", bg = "#1a1b26" } },
	{ "TelescopeNormal", { bg = "#1a1b26" } },
	{ "TelescopePromptTitle", { bg = "#ff4d4d", fg = "#000000" } },
	{ "TelescopePreviewTitle", { bg = "#79ff4d", fg = "#000000" } },
	{ "TelescopeResultsTitle", { bg = "#66ffcc", fg = "#000000" } },

	{ "NvimTreeIndentMarker", { fg = "#1affd1", bg = "#1a1b26" } },
	{ "NvimTreeWinSeparator", { fg = "#ffff4d", bg = "#1a1b26" } },
	{ "NvimTreeFolderIcon", { fg = "#e6b800", bg = "#1a1b26" } },
	{ "NvimTreeGitDeleted", { fg = "#ff4d4d" } },
	{ "NvimTreeNormal", { bg = "#1a1b26" } },

	{ "WinSeparator", { fg = "#ffff4d", bg = "#1a1b26" } },

	{ "WhichKey", { fg = "#ff00ff", bg = "#1a1b26" } },
	{ "WhichKeyBorder", { fg = "#ace600", bg = "#1a1b26" } },
	{ "WhichKeyFloat", { bg = "#1a1b26" } },

	{ "WildMenu", { fg = "#bf40bf", bg = "#1a1b26" } },

	{ "NoiceCmdlinePrompt", fg = "none", bg = "#bfff80" },
	{ "NoiceCmdlinePopupBorder", { fg = "#b84dff", bg = "#1a1b26" } },

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
	{ "NavicText", { bg = "#1a1b26", fg = "#33d6ff" } },
	{ "NavicSeparator", { bg = "#1a1b26", fg = "#ff66ff" } },

	{ "GitSignsAdd", { fg = "#00e6ac", bg = "#1a1b26" } },
	{ "GitSignsChange", { fg = "#ffff00", bg = "#1a1b26" } },
	{ "GitSignsDelte", { fg = "#ff0000", bg = "#1a1b26" } },

	{ "TreesitterContext", { bg = c.none } },

	{ "DiagnosticVirtualTextError", { bg = "#1a1b26", fg = c.error } },
	{ "DiagnosticVirtualTextWarn", { bg = "#1a1b26", fg = c.warning } },
	{ "DiagnosticVirtualTextInfo", { bg = "#1a1b26", fg = c.info } },
	{ "DiagnosticVirtualTextHint", { bg = "#1a1b26", fg = c.hint } },

	{ "LeapBackdrop", { fg = "#75a3a3" } },

	{ "PmenuSel", { bg = "#8f00b3" } },
}

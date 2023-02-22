
local present, nv = pcall(require, "navigator")

if not present then
    return
end

local dirname = function(pathname)
    local path_sep = "/"
    local strip_dir_pat = path_sep .. "([^" .. path_sep .. "]+)$"
    local strip_sep_pat = path_sep .. "$"
    if not pathname or #pathname == 0 then
        return
    end
    local result = pathname:gsub(strip_sep_pat, ""):gsub(strip_dir_pat, "")
    if #result == 0 then
        return "/"
    end
    return result
end

nv.setup({
    lsp = {
        clangd = {
            flags = {allow_incremental_sync = true, debounce_text_changes = 500},
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            root_dir = function(fname)
                return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
            end,
            cmd = {
                "clangd",
                "--background-index",
                "--suggest-missing-includes",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--enable-config",
                "--offset-encoding=utf-16",
                "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
                "--cross-file-rename",
            },
            filetypes = {"c", "cpp", "objc", "objcpp"},
        },
    },
})

vim.cmd("syntax on")

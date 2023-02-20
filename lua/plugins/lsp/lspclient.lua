local M = {}

M.dirname = function(pathname)
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

M.gopls = {
    filetypes = {"go", "go.mod", "gohtmltmpl", "gotexttmpl"},
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    message_level = vim.lsp.protocol.MessageType.Error,
    cmd = {
        "gopls",
        "-remote=auto",
        -- "-logfile=auto",
        -- "-debug=:0",
        "-remote.debug=:0",
        -- "-rpc.trace",
    },
    flags = {allow_incremental_sync = true, debounce_text_changes = 1000},
    settings = {
        gopls = {
            analyses = {unusedparams = true, unreachable = false},
            codelenses = {
                generate = true,
                gc_details = true,
                test = true,
                tidy = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            matcher = "fuzzy",
            diagnosticsDelay = "500ms",
            symbolMatcher = "fuzzy",
            buildFlags = {"-tags", "integration"},
        },
    },
    root_dir = function(fname)
        return require("lspconfig").util.root_pattern(".git")(fname) or M.dirname(fname)
    end,
}

M.phpactor = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    cmd = {"phpactor", "language-server"},
    filetypes = {"php"},
    root_dir = function(fname)
        return require("lspconfig").util.root_pattern(".git")(fname) or M.dirname(fname)
    end,
    single_file_support = true,
}

return M

local present, lspconfig = pcall(require, "lspconfig")

if not present then
    return
end

lspconfig.sumneko_lua.setup({
    on_attach = require("setup.utils").on_attach(function (client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        require("plugins.lsp.keymaps").on_attach(client, bufnr)
    end),
    capabilities = require('setup.utils').capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

vim.cmd("syntax on")

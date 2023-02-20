local present, navigator = pcall(require, "navigator")

if not present then
    return
end

return navigator.setup({
    debug = false,
    width = 0.75,
    height = 0.3,
    preview_height = 0.35,
    border = "rounded",
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    ts_fold = false,
    default_mapping = false,
    treesitter_analysis = true,
    treesitter_navigation = true,
    treesitter_analysis_max_num = 100,
    treesitter_analysis_condense = true,
    transparency = 90,
    lsp_signature_help = false,
    signature_help_cfg = nil,
    icons = {
        code_action_icon = "🏏",
        diagnostic_head = "🐛",
        diagnostic_head_severity_1 = "🈲",
    },
    mason = true,
    lsp = {
        enable = true,
        disable_lsp = {
            "angularls",
            "flow",
            "bashls",
            "dockerls",
            "julials",
            "pylsp",
            "jedi_language_server",
            "jdtls",
            "vimls",
            "html",
            "jsonls",
            "solargraph",
            "yamlls",
            "ccls",
            "sqls",
            "denols",
            "lua_ls",
            "graphql",
            "dartls",
            "dotls",
            "kotlin_language_server",
            "nimls",
            "intelephense",
            "vuels",
            "omnisharp",
            "r_language_server",
            "terraformls",
            "svelte",
            "texlab",
            "clojure_lsp",
            "elixirls",
            "sourcekit",
            "fsautocomplete",
            "vls",
            "hls",
        },
        code_action = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        code_lens_action = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        document_highlight = false,
        format_on_save = false,
        diagnostic = {
            underline = true,
            virtual_text = true,
            update_in_insert = true,
        },

        diagnostic_scrollbar_sign = {"▃", "▆", "█"},
        diagnostic_virtual_text = true,
        diagnostic_update_in_insert = true,
        disply_diagnostic_qf = false,

        gopls = require("plugins.lsp.lspclient").gopls,
        phpactor = require("plugins.lsp.lspclient").phpactor,

        servers = {
            "gopls",
            "phpactor"
        },
    },
})

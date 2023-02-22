return{
    {
        "gr",
        function()
            require("navigator.reference").async_ref()
        end,
        desc = "async_ref",
    },
    {
        "<Leader>gr",
        function()
            require("navigator.reference").reference()
        end,
        desc = "reference",
    }, -- reference deprecated
    {
        mode = "i",
        "<M-k>",
        function()
            vim.lsp.signature_help()
        end,
        desc = "signature_help",
    },
    {
        "<c-k>",
        function()
            vim.lsp.buf.signature_help()
        end,
        desc = "signature_help",
    },
    {
        "g0",
        function()
            require("navigator.symbols").document_symbols()
        end,
        desc = "document_symbols",
    },
    {
        "gW",
        function()
            require("navigator.workspace").workspace_symbol_live()
        end,
        desc = "workspace_symbol_live",
    },
    {
        "<c-]>",
        function()
            require("navigator.definition").definition()
        end,
        desc = "definition",
    },
    {
        "gd",
        function()
            require("navigator.definition").definition()
        end,
        desc = "definition",
    },
    {
        "gD",
        function()
            vim.lsp.buf.declaration()
        end,
        desc = "declaration",
    },
    {
        "gp",
        function()
            require("navigator.definition").definition_preview()
        end,
        desc = "definition_preview",
    },
    {
        "<Leader>gt",
        function()
            require("navigator.treesitter").buf_ts()
        end,
        desc = "buf_ts",
    },
    {
        "<Leader>gT",
        function()
            require("navigator.treesitter").bufs_ts()
        end,
        desc = "bufs_ts",
    },
    {
        "<Leader>ct",
        function()
            require("navigator.ctags").ctags()
        end,
        desc = "ctags",
    },
    {
        "<Space>ca",
        mode = "n",
        function()
            require("navigator.codeAction").code_action()
        end,
        desc = "code_action",
    },
    {
        "<Space>ca",
        mode = "v",
        function()
            require("navigator.codeAction").range_code_action()
        end,
        desc = "range_code_action",
    },
    {
        "<Space>rn",
        function()
            require("navigator.rename").rename()
        end,
        desc = "rename",
    },
    {
        "<Leader>gi",
        function()
            vim.lsp.buf.incoming_calls()
        end,
        desc = "incoming_calls",
    },
    {
        "<Leader>go",
        function()
            vim.lsp.buf.outgoing_calls()
        end,
        desc = "outgoing_calls",
    },
    {
        "gi",
        function()
            vim.lsp.buf.implementation()
        end,
        desc = "implementation",
    },
    {
        "<Space>D",
        function()
            vim.lsp.buf.type_definition()
        end,
        desc = "type_definition",
    },
    {
        "gL",
        function()
            require("navigator.diagnostics").show_diagnostics()
        end,
        desc = "show_diagnostics",
    },
    {
        "gG",
        function()
            require("navigator.diagnostics").show_buf_diagnostics()
        end,
        desc = "show_buf_diagnostics",
    },
    {
        "<Leader>dT",
        function()
            require("navigator.diagnostics").toggle_diagnostics()
        end,
        desc = "toggle_diagnostics",
    },
    {
        "]d",
        function()
            vim.diagnostic.goto_next()
        end,
        desc = "next diagnostics",
    },
    {
        "[d",
        function()
            vim.diagnostic.goto_prev()
        end,
        desc = "prev diagnostics",
    },
    {
        "]O",
        function()
            vim.diagnostic.set_loclist()
        end,
        desc = "diagnostics set loclist",
    },
    {
        "]r",
        function()
            require("navigator.treesitter").goto_next_usage()
        end,
        desc = "goto_next_usage",
    },
    {
        "[r",
        function()
            require("navigator.treesitter").goto_previous_usage()
        end,
        desc = "goto_previous_usage",
    },
    {
        "<C-LeftMouse>",
        function()
            vim.lsp.buf.definition()
        end,
        desc = "definition",
    },
    {
        "K",
        function ()
            vim.lsp.buf.hover()
        end,
        desc = "hover doc"
    },
    {
        "g<LeftMouse>",
        function()
            vim.lsp.buf.implementation()
        end,
        desc = "implementation",
    },
    {
        "<Leader>k",
        function()
            require("navigator.dochighlight").hi_symbol()
        end,
        desc = "hi_symbol",
    },
    {
        "<Space>wa",
        function()
            require("navigator.workspace").add_workspace_folder()
        end,
        desc = "add_workspace_folder",
    },
    {
        "<Space>wr",
        function()
            require("navigator.workspace").remove_workspace_folder()
        end,
        desc = "remove_workspace_folder",
    },
    {
        "<Space>gm",
        function()
            require("navigator.formatting").range_format()
        end,
        mode = "n",
        desc = "range format operator e.g gmip",
    },
    {
        "<Space>wl",
        function()
            require("navigator.workspace").list_workspace_folders()
        end,
        desc = "list_workspace_folders",
    },
    {
        "<Space>la",
        mode = "n",
        function()
            require("navigator.codelens").run_action()
        end,
        desc = "run code lens action",
    },
}

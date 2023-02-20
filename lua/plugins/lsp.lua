return {
    {
        "ray-x/navigator.lua",
        lazy = true,
        event = {"BufReadPre", "BufNewFile"},
        branch = "master",
        keys = require("plugins.lsp.keymaps"),
        config = function()
            require("plugins.lsp.navigator")
        end,
        dependencies = {
            {
                "ray-x/guihua.lua",
                build = "cd lua/fzy && make",
                lazy = true,
                branch = "master",
            },
            {
                "neovim/nvim-lspconfig",
                lazy = true,
                event = {"BufReadPre", "BufNewFile"},
                dependencies = {
                    {
                        "hrsh7th/cmp-nvim-lsp",
                        lazy = true,
                        cond = function()
                            return require("setup.utils").has("nvim-cmp")
                        end,
                    },
                },
            },
            {
                "williamboman/mason.nvim",
                cmd = {
                    "Mason",
                    "MasonInstallAll",
                    "MasonInstall",
                    "MasonUninstallAll",
                    "MasonInstall",
                },
                lazy = true,
                config = function()
                    require("plugins.lsp.mason")
                end,
            },
        },
    },
}

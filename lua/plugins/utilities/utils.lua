return {
    {"nvim-lua/plenary.nvim", lazy = true},
    {"nvim-tree/nvim-web-devicons", lazy = true},
    {"nvim-lua/popup.nvim", lazy = true},
    {"MunifTanjim/nui.nvim", lazy = true},
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "echasnovski/mini.bufremove",
        keys = {
            {"<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer"},
            {"<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)"},
        },
    }}

   
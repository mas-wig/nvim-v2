return{
    "NvChad/nvim-colorizer.lua",
    lazy = "true",
    ft = {"css", "html", "lua", "javascriptreact", "javascript", "typescript", "typescriptreact"},
    config = function()
        return require("colorizer").setup({
            filetypes = {"css", "html", "lua", "javascriptreact", "javascript", "typescript", "typescriptreact"},
            user_default_options = {
                names = false,
                rgb_fn = true,
                tailwind = true,
            },
        })
    end,
}

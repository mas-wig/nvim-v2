local M = {}
local autocmd = vim.api.nvim_create_autocmd

M.lazy_load = function(tb)
    autocmd(tb.events, {
        group = vim.api.nvim_create_augroup(tb.augroup_name, {}),
        callback = function()
            if tb.condition() then
                vim.api.nvim_del_augroup_by_name(tb.augroup_name)
                if tb.plugin ~= "nvim-treesitter" then
                    vim.defer_fn(function()
                        require("lazy").load({plugins = {tb.plugin}})
                        if tb.plugin == "nvim-lspconfig" then
                            vim.cmd("silent! do FileType")
                        end
                    end, 0)
                else
                    require("packer").loader(tb.plugin)
                end
            end
        end,
    })
end

M.on_file_open = function(plugin_name)
    M.lazy_load({
        events = {"BufRead", "BufWinEnter", "BufNewFile"},
        augroup_name = "BeLazyOnFileOpen" .. plugin_name,
        plugin = plugin_name,
        condition = function()
            local file = vim.fn.expand("%")
            return file ~= "NvimTree_1" and file ~= "lazy" and file ~= ""
        end,
    })
end

M.gitsigns = function()
    autocmd({"BufRead"}, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", {clear = true}),
        callback = function()
            vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
            if vim.v.shell_error == 0 then
                vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
                vim.schedule(function()
                    require("lazy").load({plugins = {"gitsigns.nvim"}})
                end)
            end
            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            if lines ~= {""} then
                vim.loop.spawn("git", {
                    args = {
                        "ls-files",
                        "--error-unmatch",
                        vim.fn.expand("%"),
                    },
                }, onexit)
            end
        end,
    })
end

return M

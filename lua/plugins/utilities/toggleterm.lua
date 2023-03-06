return{
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = "ToggleTerm",
    keys = {
        {"<A-i>", "<cmd>ToggleTerm direction=float<cr>", {desc = "Open Float Term"}},
        {"<A-v>", "<cmd>ToggleTerm direction=vertical<cr>", {desc = "Open Vert Term"}},
        {"<A-h>", "<cmd>ToggleTerm direction=horizontal<cr>", {desc = "Open Horz Term"}},
        {"<A-i>", "<cmd>ToggleTerm direction=float<cr>", {desc = "Open Float Term"}, mode = {"t"}},
        {"<A-v>", "<cmd>ToggleTerm direction=vertical<cr>", {desc = "Open Vert Term"}, mode = {"t"}},
        {"<A-h>", "<cmd>ToggleTerm direction=horizontal<cr>", {desc = "Open Horz Term"}, mode = {"t"}},
    },
    config = function()
        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        return require"toggleterm".setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 13
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.35
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            autochdir = true,
            highlights = {
                Normal = {
                    guibg = "none",
                },
                NormalFloat = {
                    link = "Normal",
                    guibg = "#16161e",
                },
                FloatBorder = {
                    guibg = "none",
                },
            },
            shade_terminals = false,
            start_in_insert = false,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "rounded",
                width = 140,
                height = 28,
                winblend = 3,
            },
            winbar = {
                enabled = false,
            },
        })
    end,
}

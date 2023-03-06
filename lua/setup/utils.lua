local M = {}

local Util = require("lazy.core.util")

local root_patterns = {".git", "package.json", "go.mod", "nvim"}

function M.map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    if not keys.active[keys.parse({lhs, mode = mode}).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

function M.has(plugin)
    return require("lazy.core.config").plugins[plugin] ~= nil
end

function M.on_attach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

function M.get_root()
    local path = vim.api.nvim_buf_get_name(0)
    path = path ~= "" and vim.loop.fs_realpath(path) or nil
    local roots = {}
    if path then
        for _, client in pairs(vim.lsp.get_active_clients({bufnr = 0})) do
            local workspace = client.config.workspace_folders
            local paths = workspace
            and vim.tbl_map(function(ws)
                return vim.uri_to_fname(ws.uri)
            end, workspace)
            or client.config.root_dir and {client.config.root_dir}
            or {}
            for _, p in ipairs(paths) do
                local r = vim.loop.fs_realpath(p)
                if path:find(r, 1, true) then
                    roots[#roots + 1] = r
                end
            end
        end
    end
    table.sort(roots, function(a, b)
        return #a > #b
    end)
    local root = roots[1]
    if not root then
        path = path and vim.fs.dirname(path) or vim.loop.cwd()
        root = vim.fs.find(root_patterns, {path = path, upward = true})[1]
        root = root and vim.fs.dirname(root) or vim.loop.cwd()
    end
    return root
end

function M.key_telescope(builtin, opts)
    local params = {builtin = builtin, opts = opts}
    return function()
        builtin = params.builtin
        opts = params.opts
        opts = vim.tbl_deep_extend("force", {cwd = M.get_root()}, opts or {})
        if builtin == "files" then
            if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
                opts.show_untracked = true
                builtin = "git_files"
            else
                builtin = "find_files"
            end
        end
        require("telescope.builtin")[builtin](opts)
    end
end

function M.toggle(option, silent, values)
    if values then
        if vim.opt_local[option]:get() == values[1] then
            vim.opt_local[option] = values[2]
        else
            vim.opt_local[option] = values[1]
        end
        return Util.info("Set " .. option .. " to " .. vim.opt_local[option]:get(), {title = "Option"})
    end
    vim.opt_local[option] = not vim.opt_local[option]:get()
    if not silent then
        if vim.opt_local[option]:get() then
            Util.info("Enabled " .. option, {title = "Option"})
        else
            Util.warn("Disabled " .. option, {title = "Option"})
        end
    end
end

function M.float_term(cmd, opts)
    opts = vim.tbl_deep_extend("force", {
        size = {width = 0.9, height = 0.9},
    }, opts or {})
    require("lazy.util").float_term(cmd, opts)
end

local enabled = true

function M.toggle_diagnostics()
    enabled = not enabled
    if enabled then
        vim.diagnostic.enable()
        Util.info("Enabled diagnostics", {title = "Diagnostics"})
    else
        vim.diagnostic.disable()
        Util.warn("Disabled diagnostics", {title = "Diagnostics"})
    end
end

function M.on_very_lazy(fn)
    vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
            fn()
        end,
    })
end

return M

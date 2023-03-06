return {
    "mhartington/formatter.nvim",
    cmd = {"Format", "FormatWrite"},
    lazy = true,
    config = function()
        local util = require("formatter.util")
        return require("formatter").setup({
            filetype = {
                ["lua"] = {function()
                    return {
                        exe = "stylua",
                        args = {"--search-parent-directories", "--stdin-filepath",
                                util.escape_path(util.get_current_buffer_file_path()), "--", "-"},
                        stdin = true
                    }
                end},
                ["php"] = {function()
                    return {
                        exe = "php-cs-fixer",
                        args = {"--no-interaction", "--quiet", "fix"},
                        stdin = false
                    }
                end},
                ["go"] = {function()
                    return {
                        exe = "gofmt",
                        args = {"|", "goimports"},
                        stdin = true
                    }
                end},

                ["javascript"] = {function()
                    return {
                        exe = "prettierd",
                        args = {util.escape_path(util.get_current_buffer_file_path())},
                        stdin = true
                    }
                end},

                ["json"] = {function()
                    return {
                        exe = "prettierd",
                        args = {util.escape_path(util.get_current_buffer_file_path())},
                        stdin = true
                    }
                end},

                ["html"] = {function()
                    return {
                        exe = "prettierd",
                        args = {util.escape_path(util.get_current_buffer_file_path())},
                        stdin = true
                    }
                end},

                ["css"] = {function()
                    return {
                        exe = "prettierd",
                        args = {util.escape_path(util.get_current_buffer_file_path())},
                        stdin = true
                    }
                end},

                ["javascriptreact"] = {function()
                    return {
                        exe = "prettierd",
                        args = {util.escape_path(util.get_current_buffer_file_path())},
                        stdin = true
                    }
                end},

                ["typescriptreact"] = {function()
                    return {
                        exe = "prettierd",
                        args = {util.escape_path(util.get_current_buffer_file_path())},
                        stdin = true
                    }
                end},

                ["typescript"] = {function()
                    return {
                        exe = "prettierd",
                        args = {util.escape_path(util.get_current_buffer_file_path())},
                        stdin = true
                    }
                end},

                ["rust"] = {function()
                    return {
                        exe = "rustfmt",
                        args = {"--emit=stdout"},
                        stdin = true
                    }
                end},

                ["cpp"] = {function()
                    return {
                        exe = "clang-format",
                        args = {},
                        stdin = true
                    }
                end},

                ["java"] = {function()
                    return {
                        exe = "clang-format",
                        args = {},
                        stdin = true
                    }
                end},
                ["c"] = {function()
                    return {
                        exe = "clang-format",
                        args = {},
                        stdin = true
                    }
                end},

                ["python"] = {function()
                    return {
                        exe = "autopep8",
                        args = {"-"},
                        stdin = true
                    }
                end}
            }
        })
    end
}

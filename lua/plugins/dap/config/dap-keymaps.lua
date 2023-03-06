return{
    {

        "<leader>dR",
        function()
            require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
    },
    {

        "<leader>dE",
        function()
            require("dapui").eval(vim.fn.input("[Expression] > "))
        end,
        desc = "Evaluate Input",
    },
    {

        "<leader>dC",
        function()
            require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
        end,
        desc = "Conditional Breakpoint",
    },
    {

        "<leader>dU",
        function()
            require("dapui").toggle()
        end,
        desc = "Toggle UI",
    },
    {

        "<leader>db",
        function()
            require("dap").step_back()
        end,
        desc = "Step Back",
    },
    {

        "<leader>dc",
        function()
            require("dap").continue()
        end,
        desc = "Continue",
    },
    {

        "<leader>dd",
        function()
            require("dap").disconnect()
        end,
        desc = "Disconnect",
    },
    {

        "<leader>de",
        function()
            require("dapui").eval()
        end,
        desc = "Evaluate",
    },
    {

        "<leader>dg",
        function()
            require("dap").session()
        end,
        desc = "Get Session",
    },

    -- Floating dap windows --
    {

        "<leader>dft",
        function()
            require("dapui").float_element("scopes", {width = 100, height = 20, enter = true})
        end,
        desc = "Scope Float",
    },
    {

        "<leader>dfr",
        function()
            require("dapui").float_element("repl", {width = 100, height = 20, enter = true})
        end,
        desc = "Repl Float",
    },
    {

        "<leader>dfc",
        function()
            require("dapui").float_element("console", {width = 100, height = 20, enter = true})
        end,
        desc = "Console Float",
    },
    {

        "<leader>dfb",
        function()
            require("dapui").float_element("breakpoints", {width = 100, height = 20, enter = true})
        end,
        desc = "Breakpoint Float",
    },
    {

        "<leader>dfs",
        function()
            require("dapui").float_element("stacks", {width = 100, height = 20, enter = true})
        end,
        desc = "Stacks Float",
    },
    {

        "<leader>dfw",
        function()
            require("dapui").float_element("watches", {width = 100, height = 20, enter = true})
        end,
        desc = "Watches Float",
    },
    -- End --

    {

        "<leader>dh",
        function()
            require("dap.ui.widgets").hover()
        end,
        desc = "Hover Variables",
    },
    {

        "<leader>dS",
        function()
            require("dap.ui.widgets").scopes()
        end,
        desc = "Scopes",
    },
    {

        "<leader>di",
        function()
            require("dap").step_into()
        end,
        desc = "Step Into",
    },
    {

        "<leader>do",
        function()
            require("dap").step_over()
        end,
        desc = "Step Over",
    },
    {

        "<leader>dp",
        function()
            require("dap").pause.toggle()
        end,
        desc = "Pause",
    },
    {

        "<leader>dq",
        function()
            require("dap").close()
        end,
        desc = "Quit",
    },
    {

        "<leader>dr",
        function()
            require("dap").repl.toggle()
        end,
        desc = "Toggle Repl",
    },
    {

        "<leader>ds",
        function()
            require("dap").continue()
        end,
        desc = "Start",
    },
    {"<leader>dt", "<cmd>DapToggleBreakpoint <CR> ", desc = "Toggle Breakpoint"},
    {

        "<leader>dx",
        function()
            require("dap").terminate()
        end,
        desc = "Terminate",
    },
    {

        "<leader>du",
        function()
            require("dap").step_out()
        end,
        desc = "Step Out",
    },

    {
        "<leader>e",
        function()
            require("dapui").eval()
        end,
        desc = "Evaluate",
        mode = {"v"},
    },
}

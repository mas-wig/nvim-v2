return {
    lua_ls = {
        cmd = {"lua-language-server"},
        settings = {
            Lua = {
                workspace = {
                    checkThirdParty = false
                },
                completion = {
                    callSnippet = "Replace"
                }
            }
        }
    }
}

return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")
        require("luasnip.loaders.from_lua").lazy_load({
            paths = "~/.config/nvim/LuaSnip/"
        })

        --- TODO: What is expand?
        vim.keymap.set({ "i" }, "<C-k>e", function() ls.expand() end,
            { silent = true, desc = "LuaSnip: Expand" })

        vim.keymap.set({ "i", "s" }, "<C-k>;", function() ls.jump(1) end,
            { silent = true, desc = "LuaSnip: Jump tp next node" })
        vim.keymap.set({ "i", "s" }, "<C-k>,", function() ls.jump(-1) end,
            { silent = true, desc = "LuaSnip: Jump to prev node" })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true, desc = "LuaSnip: Select choice" })
    end,
}

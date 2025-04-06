return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = {},
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle("diagnostics")
            end, { desc = "trouble: show diagnostics" })

            vim.keymap.set("n", "[t", function()
                require("trouble").next({ skip_groups = true, jump = true });
            end, { desc = "trouble: next diagnostic" })

            vim.keymap.set("n", "]t", function()
                require("trouble").prev({ skip_groups = true, jump = true });
            end, { desc = "trouble: prev diagnostic" })
        end
    },
}

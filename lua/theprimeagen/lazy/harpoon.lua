return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>A"
            , function() harpoon:list():prepend() end, {desc = "Harpoon: prepend"})
        vim.keymap.set("n", "<leader>a"
            , function() harpoon:list():add() end, {desc = "Harpoon: add"})
        vim.keymap.set("n", "<C-e>"
            , function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
            ,{desc = "Harpoon: toggle_quick_menu"})
    end
}

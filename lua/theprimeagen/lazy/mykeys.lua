return {
    dir = "~/ideas/dev/mykeys", -- Your path
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    name = "mykeys",
    config = function()
        vim.g.mykeys_log_level = "info"
        local mykeys = require('mykeys');

        mykeys.setup()

        vim.keymap.set("n", "<leader>mk"
        , function() mykeys.toggle() end, { desc = "mykeys: toggle" })
    end
}

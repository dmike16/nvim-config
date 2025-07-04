return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "jonarrien/telescope-cmdline.nvim",
        "mykeys"
    },

    config = function()
        require('telescope').setup({})
        require('telescope').load_extension("cmdline")
        require("telescope").load_extension("mykeys")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc='Telescope find files'})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {desc='Telescope find git files'})
        vim.keymap.set('n', '<C-h>', builtin.git_commits, {desc='Telescope show commit'})
        vim.keymap.set('n', '<C-l>', builtin.git_bcommits, {desc='Telescope show commit'})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {desc='Telescope help tags'})
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {desc='Telescope buffers'})
        vim.keymap.set('n', '<leader>q',':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
        vim.keymap.set('n', '<leader>mmk',':Telescope mykeys<CR>', { noremap = true, desc = "mykeys ext" })
    end
}


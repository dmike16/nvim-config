return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
        local home = vim.env.HOME
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_forward_search_on_start = false
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = home .. "/ideas/.texfiles/",
            out_dir = home .. "/ideas/.texfiles/"
        }
    end
}

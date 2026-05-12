return {
    {
        "lervag/vimtex",
        ft = "tex",
        init = function()
        -- Compiler: latexmk
        vim.g.vimtex_compiler_method = "latexmk"

        -- PDF Viewer: zathura
        vim.g.vimtex_view_method = "zathura"
        end
    }
}

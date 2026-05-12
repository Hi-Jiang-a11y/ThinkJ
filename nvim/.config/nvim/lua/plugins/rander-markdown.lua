vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#ffffff", bg = "#3a089c", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#ffffff", bg = "#5f27cd", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#ffffff", bg = "#9164e8", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#ffffff", bg = "#b34baa", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#ffffff", bg = "#ba6eb4", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#ffffff", bg = "#ffb6c1", bold = true })
return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",

        config = function()
            require('render-markdown').setup({
                heading = {
                    style = "inline",
                    width = "block",
                    position = 'inline',
                    left_margin = { 0, 2, 4, 6, 8, 10 },
                }
            })
        end,
    },
}

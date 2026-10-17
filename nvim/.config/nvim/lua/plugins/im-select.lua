return {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    config = function()
        -- im-select.nvim auto-detects fcitx5 and uses keyboard-us as English.
        require("im_select").setup({
            default_im_select = "keyboard-us",
            async_switch_im = true,
        })
    end,
}

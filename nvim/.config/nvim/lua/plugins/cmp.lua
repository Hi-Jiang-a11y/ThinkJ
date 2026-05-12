 return {
{
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()

        local cmp = require("cmp")

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping(function(fallback)
                    return cmp.visible() and cmp.select_next_item() or fallback()
                end, { "i", "s" }),
                ["<C-k>"] = cmp.mapping(function(fallback)
                    return cmp.visible() and cmp.select_prev_item() or fallback()
                end, { "i", "s" }),
                ["<C-l>"] = cmp.mapping(function(fallback)
                    return cmp.visible() and cmp.confirm({ select = true }) or fallback()
                end, { "i", "s" }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    return cmp.visible() and cmp.confirm({ select = true }) or fallback()
                end, { "i", "s" }),

                ["<Space>"] = cmp.mapping(function(fallback)
                    return cmp.visible() and cmp.abort() or fallback()
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
    },
}

return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("lua_ls")

      vim.lsp.config("verible", {
        cmd = { "verible-verilog-ls" },
        filetypes = { "verilog", "systemverilog" },
        root_markers = { ".git" },
        capabilities = capabilities,
      })

      vim.lsp.enable("verible")

    end,
  },
}

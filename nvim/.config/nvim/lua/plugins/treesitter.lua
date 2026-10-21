return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "tex",
          "bash",
          "json",
          "yaml",
          "python",
          "c",
          "cpp",
          "verilog",
        },
        callback = function()
          pcall(vim.treesitter.start)
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo.foldmethod = "expr"
        end,
      })
    end,
  },
}

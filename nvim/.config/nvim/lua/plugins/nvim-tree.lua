return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)

        local function remove_mapping(mode, lhs)
          pcall(vim.keymap.del, mode, lhs, { buffer = bufnr })
        end

        -- Disable file operations that are easy to trigger accidentally.
        for _, lhs in ipairs({ "r", "e", "u", "<C-r>" }) do
          remove_mapping("n", lhs)
        end
        for _, lhs in ipairs({ "d", "D", "<Del>", "c", "x", "p", "gp", "gy", "ge", "y", "Y" }) do
          remove_mapping("n", lhs)
          remove_mapping("x", lhs)
        end

        vim.keymap.set("n", "h", api.tree.change_root_to_parent, {
          buffer = bufnr,
          noremap = true,
          silent = true,
          desc = "Go to parent directory",
        })
        vim.keymap.set("n", "l", api.node.open.edit, {
          buffer = bufnr,
          noremap = true,
          silent = true,
          desc = "Open file or directory",
        })
      end,
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    },
    keys = {
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<cr>",
        desc = "Toggle file tree",
      },
    },
  },
}

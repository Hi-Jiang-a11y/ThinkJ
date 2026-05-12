require('config.juliet')
require('config.options')
require('config.bindings')

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup("plugins")
